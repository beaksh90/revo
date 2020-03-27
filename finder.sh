#!/bin/bash

ITEM="Bisphenol A"
ORIGIN="NWE"
TIMEFRAME="Month"
TRADE_TERM="FD"

TODAY=`date +'%Y-%m-%d'`

            # <string-contains field='f:commodity.f:name' pattern='${ITEM}*'/>
            # <string-contains field='f:location.f:name' pattern='${ORIGIN}'/>
            # <string-contains field='f:timeframe.f:name' pattern='${TIMEFRAME}'/>
            # <string-contains field='f:trade-terms.f:name' pattern='${TRADE_TERM}'/>
            # <string-contains field='c:id' pattern='*4031026*'/>

# Acetone Spot ex-tank China E Domestic 0-10 Days

unique_id_finder () {
    curl -k -u seongsik.y@lgchem.com:NCCbpa123 -d \
    "<request xmlns='http://iddn.icis.com/ns/search'>
        <scope>
            <type>series</type>
        </scope>
        <constraints>
            <string-contains field='f:commodity.f:name' pattern='Bisphenol A'/>
            <string-contains field='f:trade-terms.f:name' pattern='FD'/>
            <string-contains field='f:location.f:name' pattern='NWE'/>
        </constraints>
    </request>" \
    https://api.icis.com/v1/search
}

find_specific_assessment() {
    curl -s -k -u  seongsik.y@lgchem.com:NCCbpa123 -d \
    "<request xmlns='http://iddn.icis.com/ns/search'>
        <scope>
            <series>http://iddn.icis.com/series/petchem/4056014</series>
        </scope>
        <constraints>
            <compare field='c:series-order' op='ge' value='2019-04-28'/>
            <compare field='c:series-order' op='le' value='2019-05-04'/>
        </constraints>
        <view  to-currency='http://iddn.icis.com/ref-data/currency/18' >
            <field>assessment-low</field>
            <field>mid</field>
            <field>assessment-high</field>
            <field>c:series-order</field>
        </view>
    </request>" \
    https://api.icis.com/v1/search
}


        # <view to-currency='http://iddn.icis.com/ref-data/currency/20' to-measure-unit='http://iddn.icis.com/ref-data/measure-unit/2' >
        #     <field>assessment-low</field>
        #     <field>mid</field>
        #     <field>assessment-high</field>
        #     <field>c:series-order</field>
        # </view>


find_unit () {
    curl -k -u  seongsik.y@lgchem.com:NCCbpa123 -d \
        "<request xmlns='http://iddn.icis.com/ns/search'>
   <scope>
     <type>ref-data</type>
   </scope>
   <constraints>
     <kind>timeframe</kind>
   </constraints>
</request>" \
   https://api.icis.com/v1/search
}

    #  <string-contains field='c:id' pattern='http://iddn.icis.com/series/general/timeframe-020'/>
#    <view>
#        <field>c:id</field>
#        <field>name</field>
#        <field>long-name</field>
#        <field>f:measure-type.name</field>
#    </view>

#unique_id_finder ${ITEM} ${ORIGIN} ${TRADE_TERM} ${TIMEFRAME} ${TIMEFRAME} ${PUBLICATION_NAME}
#  unique_id_finder
# find_specific_assessment

find_unit