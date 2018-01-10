# -*- encoding: utf-8 -*-
{
    'name': 'Main Module',
    'version': 'beta',
    'author': 'Jordi Riera <kender.jr@gmail.com>',
    'maintainer': 'Jordi Riera <kender.jr@gmail.com>',
    'license': 'AGPL-3',
    'category': 'Main',
    'summary': 'Main Module, that install everything',
    # Don't add demo module here as it should not be installed on prod server.
    'depends': [
        # odoo
        'product',
        'res_partner',
        'sale',
        'web',
        'website',
        'website_sale',
        'project',
        'website_crm',
        'website_blog',
        'auth_signup',
        # server-tools
        'auditlog',
        # 'disable_openerp_online',
        # 'admin_technical_features',
    ],
    'data': [],
    'installable': True,
    'application': True,
}
