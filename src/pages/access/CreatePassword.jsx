import { Form, Formik } from "formik";
import React from "react";
import { BsCheckCircleFill } from "react-icons/bs";
import { FaCheck, FaEye, FaEyeSlash } from "react-icons/fa";
import { useNavigate } from "react-router";
import * as Yup from "yup";
import { StoreContext } from "../../store/StoreContext";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import { apiVersion, getUrlParam, devNavUrl } from "../../functions/functions-general";
import useQueryData from "../../functions/custom-hooks/useQueryData";
import { queryData } from "../../functions/custom-hooks/queryData";
import { setError, setMessage } from "../../store/StoreAction";
import PageNotFound from "../../partials/PageNotFound";
import FetchingSpinner from "../../partials/spinners/FetchingSpinner";
import ButtonSpinner from "../../partials/spinners/ButtonSpinner";
import { InputText } from "../../components/form-input/FormInputs";

const CreatePassword = () => {
  const { store, dispatch } = React.useContext(StoreContext);
  const [isSuccess, setIsSuccess] = React.useState(false);
  const [newPasswordShown, setNewPasswordShown] = React.useState(false);
  const [confirmPasswordShown, setConfirmPasswordShown] = React.useState(false);
  const navigate = useNavigate();
  const paramKey = getUrlParam().get("key");
  const queryClient = useQueryClient();
  const [lowerValidated, setLowerValidated] = React.useState(false);
  const [upperValidated, setUpperValidated] = React.useState(false);
  const [numberValidated, setNumberValidated] = React.useState(false);
  const [specialValidated, setSpecialValidated] = React.useState(false);
  const [lengthValidated, setLengthValidated] = React.useState(false);

  // Try system user key first, then other user key
  const { isLoading: isLoadingSys, data: sysKey } = useQueryData(
    `${apiVersion}/controllers/developers/users/system/key.php?key=${paramKey}`,
    "get",
    "sys-user-password",
  );

  const { isLoading: isLoadingOther, data: otherKey } = useQueryData(
    `${apiVersion}/controllers/developers/users/other/key.php?key=${paramKey}`,
    "get",
    "other-user-password",
  );

  // Determine which user type matched
  const isSystemUser  = sysKey?.count > 0;
  const isOtherUser   = otherKey?.count > 0;
  const isLoading     = isLoadingSys || isLoadingOther;
  const keyFound      = isSystemUser || isOtherUser;

  // Determine set-password endpoint
  const setPasswordEndpoint = isSystemUser
    ? `${apiVersion}/controllers/developers/users/system/set-password.php`
    : `${apiVersion}/controllers/developers/users/other/set-password.php`;

  const mutation = useMutation({
    mutationFn: (values) => queryData(setPasswordEndpoint, "post", values),
    onSuccess: (data) => {
      queryClient.invalidateQueries({ queryKey: ["sys-user-password"] });
      queryClient.invalidateQueries({ queryKey: ["other-user-password"] });
      if (!data.success) {
        dispatch(setError(true));
        dispatch(setMessage(data.error));
      } else {
        setIsSuccess(true);
      }
    },
  });

  const toggleNewPassword     = () => setNewPasswordShown(!newPasswordShown);
  const toggleConfirmPassword = () => setConfirmPasswordShown(!confirmPasswordShown);

  const initVal = {
    new_password:     "",
    confirm_password: "",
    key:              paramKey,
  };

  const yupSchema = Yup.object({
    new_password: Yup.string()
      .required("Required")
      .min(8, "Password must be at least 8 characters.")
      .matches(/[a-z]/, "At least one lowercase letter.")
      .matches(/[A-Z]/, "At least one uppercase letter.")
      .matches("(?=.*[!@#$%^&*`{;:',<.>/?}_-])", "At least 1 special character.")
      .matches("(?=.*[0-9])", "At least 1 number."),
    confirm_password: Yup.string()
      .required("Required")
      .oneOf([Yup.ref("new_password"), null], "Passwords do not match."),
  });

  const handleChange = (value) => {
    setLowerValidated(/(?=.*[a-z])/.test(value));
    setUpperValidated(/(?=.*[A-Z])/.test(value));
    setNumberValidated(/(?=.*[0-9])/.test(value));
    setSpecialValidated(/(?=.*[!@#$%^&*`{;:',<.>/?}_-])/.test(value));
    setLengthValidated(/(?=.{8,})/.test(value));
  };

  if (isSuccess) {
    return (
      <div className="relative flex justify-center items-center"
           style={{ transform: "translateY(clamp(5rem,12vw,8rem))" }}>
        <div className="w-96 p-6">
          <div className="flex justify-center items-center flex-col">
            <img src="/ftc_logo.png" alt="FTC Davao" className="h-16" />
          </div>
          <FaCheck className="h-16 w-16 fill-success mx-auto mt-8" />
          <h2 className="mb-4 mt-2 text-lg text-center">Success!</h2>
          <p className="text-sm text-justify mb-6">
            Your password is set and ready to use. Click the link below to continue to login.
          </p>
          <p className="mt-2 text-sm">
            Go back to{" "}
            <a href={`${devNavUrl}/login`} className="w-full text-primary">
              <u>login</u>
            </a>
          </p>
        </div>
      </div>
    );
  }

  if (!keyFound && !isLoading && (paramKey === null || paramKey === "")) {
    return <PageNotFound />;
  }

  if (isLoading) return <FetchingSpinner />;

  if (!keyFound) return <PageNotFound />;

  return (
    <div className="relative flex justify-center items-center"
         style={{ transform: "translateY(clamp(5rem,12vw,8rem))" }}>
      <div className="w-96 p-6">
        <div className="flex justify-center items-center flex-col">
          <img src="/ftc_logo.png" alt="FTC Davao" className="h-16" />
        </div>
        <p className="mt-8 mb-5 text-lg font-bold">CREATE PASSWORD</p>

        <Formik
          initialValues={initVal}
          validationSchema={yupSchema}
          onSubmit={(values) => { mutation.mutate(values); }}
        >
          {(props) => (
            <Form className="text-sm">
              {/* New Password */}
              <div className="relative mb-8">
                <InputText
                  label="New password"
                  type={newPasswordShown ? "text" : "password"}
                  name="new_password"
                  disabled={mutation.isPending}
                  onChange={(e) => handleChange(e.target.value)}
                />
                {props.values.new_password && (
                  <span className="text-base absolute bottom-1/2 right-2 translate-y-1/2 cursor-pointer"
                        onClick={toggleNewPassword}>
                    {newPasswordShown ? <FaEyeSlash /> : <FaEye />}
                  </span>
                )}
              </div>

              {/* Confirm Password */}
              <div className="relative mb-6">
                <InputText
                  label="Confirm password"
                  type={confirmPasswordShown ? "text" : "password"}
                  name="confirm_password"
                  disabled={mutation.isPending || props.values.new_password === ""}
                />
                {props.values.confirm_password && (
                  <span className="text-base absolute bottom-1/2 right-2 translate-y-1/2 cursor-pointer"
                        onClick={toggleConfirmPassword}>
                    {confirmPasswordShown ? <FaEyeSlash /> : <FaEye />}
                  </span>
                )}
              </div>

              <div className="flex items-center gap-1 pt-3">
                <button
                  type="submit"
                  disabled={
                    mutation.isPending ||
                    props.values.new_password === "" ||
                    props.values.confirm_password === ""
                  }
                  className="btn-modal-submit relative"
                >
                  {mutation.isPending ? <ButtonSpinner /> : "Save"}
                </button>
              </div>
            </Form>
          )}
        </Formik>

        {/* Password Strength Indicator */}
        <div className="py-3 rounded-sm mt-3 mb-6 text-sm">
          <span className="block mb-1 italic">Password Strength</span>
          <div className="w-full flex items-center gap-x-1">
            {[lengthValidated, lengthValidated, upperValidated && lowerValidated,
               upperValidated && lowerValidated, upperValidated && lowerValidated,
               numberValidated && specialValidated, numberValidated && specialValidated,
               numberValidated && specialValidated, numberValidated && specialValidated].map((valid, i) => (
              <div key={i}
                   className={`w-full h-1 flex flex-col justify-center overflow-hidden text-white text-center whitespace-nowrap transition duration-500 ${valid ? "bg-success/80" : "bg-success/10"}`}
              />
            ))}
          </div>
          <ul className="text-sm mt-5">
            {[
              { label: "Must have 8 characters", valid: lengthValidated },
              { label: "At least 1 uppercase",   valid: upperValidated },
              { label: "At least 1 lowercase",   valid: lowerValidated },
              { label: "At least 1 number",      valid: numberValidated },
              { label: "At least 1 symbol",      valid: specialValidated },
            ].map(({ label, valid }, i) => (
              <li key={i} className="text-body italic flex gap-2 items-center mb-2">
                <BsCheckCircleFill className={`duration-200 ${valid ? "fill-green-700" : "opacity-50"}`} />
                {label}
              </li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  );
};

export default CreatePassword;