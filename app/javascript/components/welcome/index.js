import React from 'react';

import { Grid, Button, Dialog, CardMedia } from "@mui/material";
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';
import IconButton from '@mui/material/IconButton';
import CloseIcon from '@mui/icons-material/Close';
import Slide from '@mui/material/Slide';
import Styled from "@emotion/styled";

const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="up" ref={ref} {...props} />;
});

function Index() {

    const [open, setOpen] = React.useState(false);

    const handleClickOpen = () => {
        setOpen(true);
    };

    const handleClose = () => {
        setOpen(false);
    };

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

            <Grid container spacing={3} sx={{ mt: 2, mb: 0 }}>
                <Grid item xs={12} sm={6} md={3} sx={{ textAlign: { xs: "center", md: "left" } }}>
                    <Button variant="contained" color="primary">Open the Theme Editor</Button>
                </Grid>
                <Grid item xs={6} sm={6} md={3} sx={{ display: { xs: "none", md: "block" } }}></Grid>
                <Grid item xs={12} sm={6} md={3} sx={{ textAlign: { xs: "center", md: "right" } }}>
                    <Button variant="contained" color="secondary">Continue</Button>
                </Grid>
            </Grid>

            <Grid container spacing={3} sx={{ mt: 1, mb: 2 }}>
                <Grid item xs={12} sx={{ textAlign: { xs: "center", md: "left" } }}>
                    <Button variant="text" onClick={handleClickOpen} sx={{ textTransform: "none", fontWeight: 600, color: "#000000", fontSize: 18 }}>
                        ( Check out our video )
                    </Button>
                </Grid>
            </Grid>

            <Dialog
                open={open}
                TransitionComponent={Transition}
                keepMounted
                onClose={handleClose}
                aria-describedby="alert-dialog-slide-description"
                fullWidth={true}
                maxWidth="sm"     
            >
                {/* <DialogTitle>{"Use Google's location service?"}</DialogTitle> */}
                <DialogContent sx={{ padding: 0 }}>
                    <CardMedia
                        component="iframe"
                        src="https://www.youtube.com/embed/EJr3WmbqzTY"
                        height={320}
                        sx={{ border: 0 }}
                    />
                    
                </DialogContent>
                
            </Dialog>
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
