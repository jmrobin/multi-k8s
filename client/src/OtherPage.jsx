// src/OtherPage.jsx

import React from 'react';
import { Link } from 'react-router-dom';

class OtherPage extends React.Component {
    render () {
        return(
            <div>
                <h1>Other Page</h1>
                <br/>
                <Link to="/">Go home</Link>
            </div>
        );
    }
}

export default OtherPage;