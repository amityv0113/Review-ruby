class ReviewandRating < ApplicationRecord
    def ChromeReview()
        extension_id = 'nckgahadagoaajjgafhacjanaoiihapd'
        uri = URI("https://chrome.google.com/webstore/reviews/get?hl=en&gl=IN&pv=20200420&mce=atf,pii,rtr,rlb,gtc,hcn,svp,wtd,hap,nma,dpb,ar2,ctm,ac,hot,hsf,mac,fcf,rma,lrc,irt,scm,der,bgi,bem,rae,shr,dda,igb,qso,pot,evt&_reqid=1403836&rt=j")


        header={
            'authority': 'chrome.google.com',
            'content-type': 'application/x-www-form-urlencoded;charset=UTF-8',
            
            'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36'
        }

        http = Net::HTTP.new(uri.host, uri.port)

        http.use_ssl = true

        request = Net::HTTP::Post.new(uri.request_uri, header)

        request.body = 'login=&f.req=%5B%22http%3A%2F%2Fchrome.google.com%2Fextensions%2Fpermalink%3Fid%3D'+extension_id+'%22%2C%22en%22%2C%5B175%2C0%5D%2C2%2C%5B2%5D%5D&t=AHUv8HGTtb9fVXZ4YJddPHg5441kGzfNPA%3A1594755233262&'

        response = http.request(request)

        l= response.body[5,response.body.length]
        data=(JSON.parse(l))


        array_of_reviews = data[0][1][4]


        arr_of_reviews_object = []

        for i in array_of_reviews do
        # puts(i[3])
            val = {'user_id'=>i[2][0],'name'=>i[2][1],'rating'=>i[3],'review'=>i[4]}
            arr_of_reviews_object.push(val)
        
        end

        puts arr_of_reviews_object

        # for i in arr_of_reviews_object do
        #     puts i["name"]
        # end
    end

end
