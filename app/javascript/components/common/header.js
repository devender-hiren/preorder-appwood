import React from 'react';
// Components
import TopMenu from './top-menu';
// Material UI
import { Grid } from '@mui/material';

// CSS
import Styled from '@emotion/styled';

function Header() {
    return(
        <HeaderContainer container component="header" spacing={0}>
            <Grid item xs={12} sm={4} md={3} sx={{ textAlign: { xs: "center", sm: "left" } }}>
                <Logo src="/assets/appwood-logo.png" />
            </Grid>
            <Grid item xs={12} sm={8} md={9}>
                <TopMenu />
            </Grid>
        </HeaderContainer>
    )
}

export default Header;

const HeaderContainer = Styled(Grid)`
    background: #f4f4f4;
    padding: 1em 1em;
    background: linear-gradient(90.24deg, #CD4DD1 0.01%, #ABB3ED 69.85%);
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

    display: flex;
    align-items: center;
`;

const Logo = Styled.img`
    max-width: 100%;
    width: 200px;
`;