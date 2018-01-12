import logging

from odoo.tests import common

logger = logging.getLogger(__name__)


def branches(i):
    """Simple function with 2 branches"""
    if i == 1:
        res = True
    if i == 2:
        res = False
    return res


class TestResPartner(common.TransactionCase):

    def test_create(self):
        """Test to check we talk with the db and other odoo.addons."""
        name = 'tpartner'
        partner = self.env['res.partner'].create({'name': name})
        self.assertEqual(name, partner.name)

    def test_branches(self):
        """Test to see how branches are reported in cov reports"""
        self.assertTrue(branches(1))
