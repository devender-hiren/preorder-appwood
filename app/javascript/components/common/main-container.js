import React from "react";
import Header from "./header";

import { createTheme, ThemeProvider } from "@mui/material/styles";

const theme = createTheme({
  typography: {
    fontFamily: ["Source Sans Pro", "sans-serif"].join(","),
  },
  components: {
    // Name of the component ⚛️
    MuiButton: {
      styleOverrides: {
        root: ({ ownerState }) => ({
          ...(ownerState.variant === "contained" &&
          ownerState.color === "primary"
            ? {
                backgroundColor: "#ABB3ED",
                color: "#FFFFFF",
                borderRadius: "30px",
                textTransform: "none",
                fontWeight: "600",
                padding: "8px 25px",
                minWidth: 200,
                "&:hover": {
                  backgroundColor: "#7985db",
                },
              }
            : ownerState.color === "secondary" && {
                backgroundColor: "#CD4DD1",
                color: "#FFFFFF",
                borderRadius: "30px",
                textTransform: "none",
                fontWeight: "600",
                padding: "8px 25px",
                minWidth: 200,
                "&:hover": {
                  backgroundColor: "#d22cd7",
                },
              }),
        }),
      },
    },
  },
});

function MainContainer(props) {
  return (
    <ThemeProvider theme={theme}>
      <div className="main-container">
        <Header />
        <div className="main-container-body">{props.children}</div>
      </div>
    </ThemeProvider>
  );
}

export default MainContainer;
