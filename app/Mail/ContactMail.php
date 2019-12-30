<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class ContactMail extends Mailable
{
    use Queueable, SerializesModels;
    public $request;

    public function __construct($request)
    {
        $this->request = $request;
    }
    public function build()
    {
        if ($_POST["contact"] == 'info') {
            return $this->from('info@thevinylshop.com', 'The Vinyl Shop - Info')
                ->cc('info@thevinylshop.com', 'The Vinyl Shop - Info')
                ->subject('The Vinyl Shop - Contact Form')
                ->markdown('email.contact');
        }
        elseif ($_POST["contact"] == 'billing') {
            return $this->from('billing@thevinylshop.com', 'The Vinyl Shop - Billing')
                ->cc('billing@thevinylshop.com', 'The Vinyl Shop - Billing')
                ->subject('The Vinyl Shop - Contact Form')
                ->markdown('email.contact');
        }
        elseif ($_POST["contact"] == 'support') {
            return $this->from('support@thevinylshop.com', 'The Vinyl Shop - Support')
                ->cc('support@thevinylshop.com', 'The Vinyl Shop - Support')
                ->subject('The Vinyl Shop - Contact Form')
                ->markdown('email.contact');
        }
    }
}
