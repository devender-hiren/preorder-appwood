import React from 'react';

// CSS
import Styled from '@emotion/styled';


function TopMenu() {

    const menuItem = [
        {
            title: "support: info@example.com",
            link: "mailto:info@example.com"
        },
        {
            title: "Shop Link",
            link: "#"
        }
    ]

    return(
        <TopMenuUl>
            {menuItem.map( (item,index) => (
                <li key={index}>
                    <a href={item.link}>{item?.icon} {item.title}</a>
                </li>
            ))}
        </TopMenuUl>
    )

}

export default TopMenu;

const TopMenuUl = Styled.ul`
    list-style: none;
    padding: 0;
    margin: 0;
    text-align: right;

    @media (max-width: 599px) {
        text-align: center;
        margin-top: 10px;
    }

    li {
        display: inline-block;

        &:not(:first-of-type) {
            margin-left: 1.5em;
        }

        a {
            font-size: 18px;
            color: #ffffff;
            text-decoration: none;

            display: flex;
            align-items: center;

            &:hover {
                color: #000000;
            }
        }
    }
`;