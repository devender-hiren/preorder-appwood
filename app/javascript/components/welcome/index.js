import React from 'react';

import { Grid, Button } from "@mui/material";
import Styled from "@emotion/styled";

function Index() {
    return(
        <React.Fragment>
            <h1 className="page-title">👋 Welcome</h1>
            <Grid container spacing={2} sx={{ mt: 2 }}>
                <Grid item xs={12} sm={4} md={3}>
                    <BoxItem>
                        Box 1
                    </BoxItem>
                </Grid>

                <Grid item xs={12} sm={4} md={3}>
                    <BoxItem>
                        Box 2
                    </BoxItem>
                </Grid>

                <Grid item xs={12} sm={4} md={3}>
                    <BoxItem>
                        Box 3
                    </BoxItem>
                </Grid>
            </Grid>

            <Grid container spacing={3} sx={{ mt: 2, mb: 2 }}>
                <Grid item xs={12} sm={6} md={3} sx={{ textAlign: { xs: "center", md: "left" } }}>
                    <Button variant="contained" color="primary">Open the Theme Editor</Button>
                </Grid>
                <Grid item xs={6} sm={6} md={3} sx={{ display: { xs: "none", md: "block" } }}></Grid>
                <Grid item xs={12} sm={6} md={3} sx={{ textAlign: { xs: "center", md: "right" } }}>
                    <Button variant="contained" color="secondary">Continue</Button>
                </Grid>
            </Grid>
        </React.Fragment>
    )
}

export default Index;

const BoxItem = Styled.div`
    border: 2px solid rgba(0,0,0,0.5);
    min-height: 400px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 5px;
    color: rgba(0,0,0,0.5);
    font-size: 18px;
`;
