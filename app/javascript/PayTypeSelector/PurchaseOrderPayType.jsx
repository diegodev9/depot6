import React from "react";

class PurchaseOrderPayType extends React.Component {
    render () {
        return(
            <div>
                <div className="field">
                    <label htmlFor="order_po_number" className="col-form-label-sm">PO #</label>
                    <input type="password" name="order[po_number]" id="order_po_number" className="form-control"/>
                </div>
            </div>
        )
    }
}
export default PurchaseOrderPayType
