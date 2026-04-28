import { devNavUrl, urlDeveloper } from "../functions/functions-general";
import Donors from "../pages/developer/donors/Donors";
import Children from "../pages/developer/children/Children";

export const routesDeveloper = [
  // Default — redirect to donors
  {
    path: `${devNavUrl}/${urlDeveloper}/`,
    element: <Donors />,
  },
  // Donor List
  {
    path: `${devNavUrl}/${urlDeveloper}/donors`,
    element: <Donors />,
  },
  // Children List
  {
    path: `${devNavUrl}/${urlDeveloper}/children`,
    element: <Children />,
  },
];