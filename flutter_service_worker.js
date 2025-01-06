'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5164108db79277557a3c0a18d0597bf0",
"assets/AssetManifest.bin.json": "19990c3b36f81d4b575dd4a711292219",
"assets/AssetManifest.json": "f8b6a4295adcefc59c74527eadcb01e0",
"assets/assets/cap/b.svg": "998aff894af6e78cd3e68db0a0790268",
"assets/assets/cap/c.svg": "ac0e98b6c2950a1c5af4e308217c534c",
"assets/assets/cap/f.svg": "1e92c08a5da4693fd12de69a92cc19f0",
"assets/assets/cap/p.svg": "ea285b048db2a00e99617bc10d593a3b",
"assets/assets/cap/s.svg": "040fdfdf035b15f5ebde0ec8e54dc71a",
"assets/assets/cap/texture/black/e_b_black.png": "5236f480bea26b7724d7ae7473521916",
"assets/assets/cap/texture/black/e_c_black.png": "e5a40112513b8306f36a5c5ac5a190be",
"assets/assets/cap/texture/black/e_f_black.png": "08ff0fd0d163f9dacd1af7f36a001c3b",
"assets/assets/cap/texture/black/e_p_black.png": "109fe8ec948001bad764c12a41246ca3",
"assets/assets/cap/texture/black/e_s_black.png": "32b4290e21826bdde5f8535f1f274457",
"assets/assets/cap/texture/black/e_x_black.png": "85364b0e0b655cd103b5584950d95026",
"assets/assets/cap/texture/black/g_b_black.png": "210a4a48beed6e8fa2369c79ad489b36",
"assets/assets/cap/texture/black/g_c_black.png": "fcf70519c8b00ce213eb36fdbfda8c5c",
"assets/assets/cap/texture/black/g_f_black.png": "25f46241483807cfd51a7d3935113431",
"assets/assets/cap/texture/black/g_p_black.png": "1829e5422a6b7b706156c880ab3d896b",
"assets/assets/cap/texture/black/g_s_black.png": "bdaf33f2290f8cc22ccb7d17d4999ae6",
"assets/assets/cap/texture/black/g_x_black.png": "e75cea378cf6e38e1d60eea565173214",
"assets/assets/cap/texture/black/h_b_black.png": "788db3f8c3b3dc24e1b46f19e9131b7a",
"assets/assets/cap/texture/black/h_c_black.png": "6eda7483a4943cdaef57e9b570c4657c",
"assets/assets/cap/texture/black/h_f_black.png": "6af70f0a1805aeba1120434f63c48ada",
"assets/assets/cap/texture/black/h_p_black.png": "589bf1d46a75fcd277b4ded7630c81dc",
"assets/assets/cap/texture/black/h_s_black.png": "ea6d27dccb9fbe3dae995045f9a47ce0",
"assets/assets/cap/texture/black/h_x_black.png": "57712c557f43ccaef7a99bd8b9bcfc32",
"assets/assets/cap/texture/black/i_b_black.png": "321a1b18a8c0ce9aaba741cc0e451542",
"assets/assets/cap/texture/black/i_c_black.png": "45f38adfc25b7a6299affe0cc46a703f",
"assets/assets/cap/texture/black/i_f_black.png": "a99576c65da5dc4c638d602e1344c335",
"assets/assets/cap/texture/black/i_p_black.png": "531c0f999e835c59999b1af851559fb3",
"assets/assets/cap/texture/black/i_s_black.png": "e87ffd80ecea3ad60507c893c67eb208",
"assets/assets/cap/texture/black/i_x_black.png": "d4e22593eeff1b8530485bb64a5d09ad",
"assets/assets/cap/texture/black/k_b_black.png": "e9f86d99e70533a09025a29c36fb65b8",
"assets/assets/cap/texture/black/k_c_black.png": "05ca1406eb77df262921b4b90ca8e5f1",
"assets/assets/cap/texture/black/k_f_black.png": "9cc59c5bc759cd125d67f3b1239d11df",
"assets/assets/cap/texture/black/k_p_black.png": "b257757bb080262c7d615aef35716450",
"assets/assets/cap/texture/black/k_s_black.png": "5ed40a1b84068826ba89f759facb276c",
"assets/assets/cap/texture/black/k_x_black.png": "d190b1303b5103e2f47ead3ca06c714c",
"assets/assets/cap/texture/black/l_b_black.png": "e3744fb436476529b34dd5cc09ce1187",
"assets/assets/cap/texture/black/l_c_black.png": "32a93e69073c07f25699f33028b10499",
"assets/assets/cap/texture/black/l_f_black.png": "0a8a1a57d50af517a14dbbe677b999d0",
"assets/assets/cap/texture/black/l_p_black.png": "c288da93ba16bfa43036f777cd7d3287",
"assets/assets/cap/texture/black/l_s_black.png": "f495a71b1de5507fce2656ba17f44907",
"assets/assets/cap/texture/black/l_x_black.png": "d928f7dcc62284a8b0eb4aaa4a3f6835",
"assets/assets/cap/texture/black/s_b_black.png": "5422ab5c7473f7c5c7faebe369def096",
"assets/assets/cap/texture/black/s_c_black.png": "0f17279a8af03beafc11a3a2d3f6c67e",
"assets/assets/cap/texture/black/s_f_black.png": "aeb44448c468d23085584ecc82455df8",
"assets/assets/cap/texture/black/s_p_black.png": "defb620795db64ad0bd63b85067638cf",
"assets/assets/cap/texture/black/s_s_black.png": "0c20190ee47740764e51782fa4ca2767",
"assets/assets/cap/texture/black/s_x_black.png": "cafc92d3f968db062dcc375c404b24d8",
"assets/assets/cap/texture/black/t_b_black.png": "f328d3e5c5c0c41d6f71fd05eaa6fcc4",
"assets/assets/cap/texture/black/t_c_black.png": "e814c778a1710886eff0f1bb683571d3",
"assets/assets/cap/texture/black/t_f_black.png": "aea20b70f55d75be68e040e4ec108631",
"assets/assets/cap/texture/black/t_p_black.png": "ccac53d23356d2b82bbc96cce92c25d8",
"assets/assets/cap/texture/black/t_s_black.png": "9f816151c373f0de6f1b0fce8b9bd6b3",
"assets/assets/cap/texture/black/t_x_black.png": "2360c9348e905ac81adccc2ffa35643e",
"assets/assets/cap/texture/black/w_b_black.png": "a526f721a3f36a8b0c71881e9ad58121",
"assets/assets/cap/texture/black/w_c_black.png": "27fdf6eb9593a7bd5a9e9b646cc3cbbd",
"assets/assets/cap/texture/black/w_f_black.png": "5f7ef9eb8fa0ebe10f249750cfd1fa1f",
"assets/assets/cap/texture/black/w_p_black.png": "2f3a5104ffc39a647b9e3545997d2620",
"assets/assets/cap/texture/black/w_s_black.png": "078570a8479bbaa3cd940d49db170935",
"assets/assets/cap/texture/black/w_x_black.png": "0688d090c031b43e7d65bc9780937ce4",
"assets/assets/cap/texture/black/y_b_black.png": "af109088f31871d404af39acce57dd99",
"assets/assets/cap/texture/black/y_c_black.png": "6957fc6cc5d513ad2ce0a809a614f0d0",
"assets/assets/cap/texture/black/y_f_black.png": "5d78610e2d963cf438ebee2ec4c20717",
"assets/assets/cap/texture/black/y_p_black.png": "390f0e53a6966b21c9f84b5b077f8d54",
"assets/assets/cap/texture/black/y_s_black.png": "c3f28551bd724bfb2469b1b4458281e0",
"assets/assets/cap/texture/black/y_x_black.png": "33909cfc896886f4126a678256cd8c6c",
"assets/assets/cap/texture/other/e_b.png": "14bb03a414f4e57c521f9352261dafed",
"assets/assets/cap/texture/other/e_c.png": "791ac4ac690c072dd487fcb3429bc019",
"assets/assets/cap/texture/other/e_f.png": "b5612636f4b1192cc5be1e9938e4ca6b",
"assets/assets/cap/texture/other/e_p.png": "d8b1a228806dde1221c050bec0acf5a5",
"assets/assets/cap/texture/other/e_s.png": "2d999caeebe4cabb201617e3ee8afaea",
"assets/assets/cap/texture/other/e_x.png": "9b88d8ae98443ac9b81bba42cf93ffd2",
"assets/assets/cap/texture/other/g_b.png": "6923773b27d65356a086239a5ff21e66",
"assets/assets/cap/texture/other/g_c.png": "49fe2dd6505b4fd6c50536fc793d2c23",
"assets/assets/cap/texture/other/g_f.png": "9daae2dab1030709d87d7fd4f3bf13c7",
"assets/assets/cap/texture/other/g_p.png": "2818a64bf94b60b9930932bcf4fb1a65",
"assets/assets/cap/texture/other/g_s.png": "6570e30f8f7d49ab2c36274c7453bd8b",
"assets/assets/cap/texture/other/g_x.png": "79e93617f21429bcf423731fe56b3e39",
"assets/assets/cap/texture/other/h_b.png": "788db3f8c3b3dc24e1b46f19e9131b7a",
"assets/assets/cap/texture/other/h_c.png": "6eda7483a4943cdaef57e9b570c4657c",
"assets/assets/cap/texture/other/h_f.png": "6af70f0a1805aeba1120434f63c48ada",
"assets/assets/cap/texture/other/h_p.png": "589bf1d46a75fcd277b4ded7630c81dc",
"assets/assets/cap/texture/other/h_s.png": "ea6d27dccb9fbe3dae995045f9a47ce0",
"assets/assets/cap/texture/other/h_x.png": "57712c557f43ccaef7a99bd8b9bcfc32",
"assets/assets/cap/texture/other/i_b.png": "a26e75375caffb784d27d6a1d76f3bb6",
"assets/assets/cap/texture/other/i_c.png": "8998f80aff9ca80a1185725fb5a34a7f",
"assets/assets/cap/texture/other/i_f.png": "1df128c1b1deea80277b047437b55950",
"assets/assets/cap/texture/other/i_p.png": "70b794d5e13907b3e8dede65c010077e",
"assets/assets/cap/texture/other/i_s.png": "fe035d1210cbcded2573cd8a9c1f2247",
"assets/assets/cap/texture/other/i_x.png": "c55bcdc009715b2de70d88ac8c5b9631",
"assets/assets/cap/texture/other/k_b.png": "e9f86d99e70533a09025a29c36fb65b8",
"assets/assets/cap/texture/other/k_c.png": "05ca1406eb77df262921b4b90ca8e5f1",
"assets/assets/cap/texture/other/k_f.png": "9cc59c5bc759cd125d67f3b1239d11df",
"assets/assets/cap/texture/other/k_p.png": "b257757bb080262c7d615aef35716450",
"assets/assets/cap/texture/other/k_s.png": "5ed40a1b84068826ba89f759facb276c",
"assets/assets/cap/texture/other/k_x.png": "d190b1303b5103e2f47ead3ca06c714c",
"assets/assets/cap/texture/other/l_b.png": "60afd33d58ae96bc9325063b23dd3fa3",
"assets/assets/cap/texture/other/l_c.png": "ad047e42724bebabaf32746f24dc5e4e",
"assets/assets/cap/texture/other/l_f.png": "ca18f54e132f51885b9817a443ef0450",
"assets/assets/cap/texture/other/l_p.png": "5248fda41f82c04f1583288cd6021915",
"assets/assets/cap/texture/other/l_s.png": "f4f734b4cef4b0f7d50fc5307ca50ce7",
"assets/assets/cap/texture/other/l_x.png": "4f30623c32edcab16f9bf601edd80dbd",
"assets/assets/cap/texture/other/s_b.png": "5422ab5c7473f7c5c7faebe369def096",
"assets/assets/cap/texture/other/s_c.png": "0f17279a8af03beafc11a3a2d3f6c67e",
"assets/assets/cap/texture/other/s_f.png": "aeb44448c468d23085584ecc82455df8",
"assets/assets/cap/texture/other/s_p.png": "defb620795db64ad0bd63b85067638cf",
"assets/assets/cap/texture/other/s_s.png": "0c20190ee47740764e51782fa4ca2767",
"assets/assets/cap/texture/other/s_x.png": "cafc92d3f968db062dcc375c404b24d8",
"assets/assets/cap/texture/other/t_b.png": "f328d3e5c5c0c41d6f71fd05eaa6fcc4",
"assets/assets/cap/texture/other/t_c.png": "e814c778a1710886eff0f1bb683571d3",
"assets/assets/cap/texture/other/t_f.png": "aea20b70f55d75be68e040e4ec108631",
"assets/assets/cap/texture/other/t_p.png": "ccac53d23356d2b82bbc96cce92c25d8",
"assets/assets/cap/texture/other/t_s.png": "9f816151c373f0de6f1b0fce8b9bd6b3",
"assets/assets/cap/texture/other/t_x.png": "2360c9348e905ac81adccc2ffa35643e",
"assets/assets/cap/texture/other/w_b.png": "a526f721a3f36a8b0c71881e9ad58121",
"assets/assets/cap/texture/other/w_c.png": "27fdf6eb9593a7bd5a9e9b646cc3cbbd",
"assets/assets/cap/texture/other/w_f.png": "5f7ef9eb8fa0ebe10f249750cfd1fa1f",
"assets/assets/cap/texture/other/w_p.png": "2f3a5104ffc39a647b9e3545997d2620",
"assets/assets/cap/texture/other/w_s.png": "078570a8479bbaa3cd940d49db170935",
"assets/assets/cap/texture/other/w_x.png": "0688d090c031b43e7d65bc9780937ce4",
"assets/assets/cap/texture/other/y_b.png": "af109088f31871d404af39acce57dd99",
"assets/assets/cap/texture/other/y_c.png": "04a59a68136cb7c44f6d37f283aecf9a",
"assets/assets/cap/texture/other/y_f.png": "e25f782915d07d7fe69a21b321661924",
"assets/assets/cap/texture/other/y_p.png": "be14fd0c6fb0a4f2061e7c9c9182f9a7",
"assets/assets/cap/texture/other/y_s.png": "4a80757ca91db2be66f368eb7b4eea83",
"assets/assets/cap/texture/other/y_x.png": "c8fc6088e569dce925ccbed70883b256",
"assets/assets/cap/texture/white/e_b_white.png": "14bb03a414f4e57c521f9352261dafed",
"assets/assets/cap/texture/white/e_c_white.png": "791ac4ac690c072dd487fcb3429bc019",
"assets/assets/cap/texture/white/e_f_white.png": "b5612636f4b1192cc5be1e9938e4ca6b",
"assets/assets/cap/texture/white/e_p_white.png": "d8b1a228806dde1221c050bec0acf5a5",
"assets/assets/cap/texture/white/e_s_white.png": "2d999caeebe4cabb201617e3ee8afaea",
"assets/assets/cap/texture/white/e_x_white.png": "9b88d8ae98443ac9b81bba42cf93ffd2",
"assets/assets/cap/texture/white/g_b_white.png": "b8f1f4b7bc711b16c9a2c3b080e2e16f",
"assets/assets/cap/texture/white/g_c_white.png": "49fe2dd6505b4fd6c50536fc793d2c23",
"assets/assets/cap/texture/white/g_f_white.png": "0c66e1f682b9777d309da7c7f4ae89e1",
"assets/assets/cap/texture/white/g_p_white.png": "d78b653ae105da5eb42d846c42ccd54d",
"assets/assets/cap/texture/white/g_s_white.png": "6570e30f8f7d49ab2c36274c7453bd8b",
"assets/assets/cap/texture/white/g_x_white.png": "2e0325b7a74e06a48f35b7c2ca16f512",
"assets/assets/cap/texture/white/h_b_white.png": "9f5d78d04c512b3fa07ef941944ffd38",
"assets/assets/cap/texture/white/h_c_white.png": "7ab82409f976b2e5d2068fc5aeda6995",
"assets/assets/cap/texture/white/h_f_white.png": "bdeaef4fd8d28927fe7a5b76004318d2",
"assets/assets/cap/texture/white/h_p_white.png": "e61fb1970e76d10e103c5a80ac18ac1c",
"assets/assets/cap/texture/white/h_s_white.png": "3e0724143fef3abe664c8ccfa59b8544",
"assets/assets/cap/texture/white/h_x_white.png": "723bbddf645c090410e6036a9fd8235c",
"assets/assets/cap/texture/white/i_b_white.png": "a26e75375caffb784d27d6a1d76f3bb6",
"assets/assets/cap/texture/white/i_c_white.png": "c55bcdc009715b2de70d88ac8c5b9631",
"assets/assets/cap/texture/white/i_f_white.png": "1df128c1b1deea80277b047437b55950",
"assets/assets/cap/texture/white/i_p_white.png": "70b794d5e13907b3e8dede65c010077e",
"assets/assets/cap/texture/white/i_s_white.png": "fe035d1210cbcded2573cd8a9c1f2247",
"assets/assets/cap/texture/white/i_x_white.png": "8998f80aff9ca80a1185725fb5a34a7f",
"assets/assets/cap/texture/white/k_b_white.png": "eeebf38c3a964751e40da8837f4a0b25",
"assets/assets/cap/texture/white/k_c_white.png": "ad0ef00188fac68727cfda12d917e306",
"assets/assets/cap/texture/white/k_f_white.png": "bf8823b44d15280dfea4c29bba894692",
"assets/assets/cap/texture/white/k_p_white.png": "c506221e1f50dbc6a1cd6c77f0658ce6",
"assets/assets/cap/texture/white/k_s_white.png": "3b3fab9c3e0ace1e047c9463fa45afd1",
"assets/assets/cap/texture/white/k_x_white.png": "c8ed847c84323f1451f49c692c3d13f1",
"assets/assets/cap/texture/white/l_b_white.png": "60afd33d58ae96bc9325063b23dd3fa3",
"assets/assets/cap/texture/white/l_c_white.png": "ad047e42724bebabaf32746f24dc5e4e",
"assets/assets/cap/texture/white/l_f_white.png": "ca18f54e132f51885b9817a443ef0450",
"assets/assets/cap/texture/white/l_p_white.png": "5248fda41f82c04f1583288cd6021915",
"assets/assets/cap/texture/white/l_s_white.png": "f4f734b4cef4b0f7d50fc5307ca50ce7",
"assets/assets/cap/texture/white/l_x_white.png": "4f30623c32edcab16f9bf601edd80dbd",
"assets/assets/cap/texture/white/s_b_white.png": "5422ab5c7473f7c5c7faebe369def096",
"assets/assets/cap/texture/white/s_c_white.png": "0f17279a8af03beafc11a3a2d3f6c67e",
"assets/assets/cap/texture/white/s_f_white.png": "aeb44448c468d23085584ecc82455df8",
"assets/assets/cap/texture/white/s_p_white.png": "defb620795db64ad0bd63b85067638cf",
"assets/assets/cap/texture/white/s_s_white.png": "0c20190ee47740764e51782fa4ca2767",
"assets/assets/cap/texture/white/s_x_white.png": "cafc92d3f968db062dcc375c404b24d8",
"assets/assets/cap/texture/white/t_b_white.png": "6765e0e4140867147a1dd6cc0a47ce6f",
"assets/assets/cap/texture/white/t_c_white.png": "7c954e6c08353c3ea8f4448e342479ff",
"assets/assets/cap/texture/white/t_f_white.png": "e61a826f2de045d6546f798b12d2a7a9",
"assets/assets/cap/texture/white/t_p_white.png": "fda87dae8a0974db5a9e47e0754d5c73",
"assets/assets/cap/texture/white/t_s_white.png": "34953c5cc8a034fcaff8ed26c4064079",
"assets/assets/cap/texture/white/t_x_white.png": "21fa4424aaa7c3b762e683c493ea8018",
"assets/assets/cap/texture/white/w_b_white.png": "c68c7a5dfc003d3a43bc63e169e644b9",
"assets/assets/cap/texture/white/w_c_white.png": "acd78d809682a7c15a1f06a162116875",
"assets/assets/cap/texture/white/w_f_white.png": "708ebbaf2ae052212074a60b1cb01d4b",
"assets/assets/cap/texture/white/w_p_white.png": "c2c0de977cc8edcfa6e4bd2f15115e07",
"assets/assets/cap/texture/white/w_s_white.png": "09e0f59e8fddec204372c1b564ee9e86",
"assets/assets/cap/texture/white/w_x_white.png": "524476370709e37d324ed9e2cfe2f39a",
"assets/assets/cap/texture/white/y_b_white.png": "fb05dcf9adfeb55b79fa2a726498742c",
"assets/assets/cap/texture/white/y_c_white.png": "39d6a16f06e14ed6f7e496b3cbafc25b",
"assets/assets/cap/texture/white/y_f_white.png": "e15595b04a5059758ec85b9378bafe52",
"assets/assets/cap/texture/white/y_p_white.png": "b1e886b9b82c9a59001a3c678cd8ebbc",
"assets/assets/cap/texture/white/y_s_white.png": "c7aafe34330fef302acd826b717c702e",
"assets/assets/cap/texture/white/y_x_white.png": "d13ec1fc9a3f27f4029e79178314a6bc",
"assets/assets/cap/x.svg": "c07c7d73169bcc62e7db8bf90d175185",
"assets/assets/gills/c.svg": "7fbbf1de6af38c383f73c37a13663588",
"assets/assets/gills/c_s.svg": "c081eef04639e75964ca3728e49724d9",
"assets/assets/gills/d.svg": "a26f181533eef1cf53d9674303b36c4d",
"assets/assets/gills/d_s.svg": "65414f2af3a7c4a16e07117301b4e69b",
"assets/assets/gills/f.svg": "16506e86a53216fcfcbd38e74dba2793",
"assets/assets/gills/f_s.svg": "6e4788d11658164538ebb54226cf83bc",
"assets/assets/Group.svg": "a8f700fc655a8123f09c2258d2b64de2",
"assets/assets/icons/bell.svg": "ea2d9bee630d0956844024619f4af11a",
"assets/assets/icons/bulbous.svg": "aa5fcc6bc8010f26b72679f6e882ad7c",
"assets/assets/icons/close.svg": "3701c9de6f805ee8939287324e81bd9d",
"assets/assets/icons/club.svg": "d975cfc743df4d808d90843850c7644a",
"assets/assets/icons/cobwebby.svg": "d7b9e7b7aca870a6ce86666fe105a3df",
"assets/assets/icons/conical.svg": "0da453fe8527617c971c95cc340726c4",
"assets/assets/icons/convex.svg": "6a6c7035eec47832222a15c041898172",
"assets/assets/icons/cup.svg": "8916fdb6397208492d881eb35200e741",
"assets/assets/icons/distant.svg": "66b8abe96a6a1c3b23497a8fc6ecf114",
"assets/assets/icons/equal.svg": "d730dc806b6df3f2d68514459f46662f",
"assets/assets/icons/evenescent.svg": "18a33430d5f484c721a6a0cdfafeb63c",
"assets/assets/icons/fibrous.svg": "fc07cd7711b656abe11289f353f252af",
"assets/assets/icons/flaring.svg": "377b7dff1e1fd609522dc70078cef0e4",
"assets/assets/icons/flat.svg": "d640048221da1b53039e1d4913406638",
"assets/assets/icons/fleshy.svg": "9c08e0c398ba2c35acf3772375376ad1",
"assets/assets/icons/grooved.svg": "2f40018a76b0ee2a3a553b7a3c8e874e",
"assets/assets/icons/grooves.svg": "2760bbf0ac9a4f488ce53483c75aee07",
"assets/assets/icons/large.svg": "4d0c23abd9ec6770b03fd73ecd383040",
"assets/assets/icons/leathery.svg": "fc09325f9a096e3a2bab52c15c91f2ad",
"assets/assets/icons/moveable.svg": "6c4cd5db73e2fdbb74f6ffaaf824a618",
"assets/assets/icons/none.svg": "5112566d5871e62477e9945dd2b3be58",
"assets/assets/icons/pendant.svg": "cf5801ddcb6dc1c436b2594dae7aa993",
"assets/assets/icons/rhizomorphs.svg": "501a521f52eb8bcf98de836aeb330108",
"assets/assets/icons/rooted.svg": "31f8367cb4c8bb463c75ac18ce340803",
"assets/assets/icons/scales.svg": "f0b497a0458e0aff61fadcf4b139a0b9",
"assets/assets/icons/scaly.svg": "630c74f636e6191da8e329b531468d61",
"assets/assets/icons/sheathing.svg": "296bff9f471379a346f468b4fda61d1f",
"assets/assets/icons/shiny.svg": "25f5876e7af84e725f6ba92eba7b1edc",
"assets/assets/icons/silky.svg": "91c29adab8f5440832de3032bc9c5771",
"assets/assets/icons/smooth.svg": "c2f4d373efbe888f529b6ee6e453cb3c",
"assets/assets/icons/spherical.svg": "c49b8d1a77ecca3bbfbab3856b19f441",
"assets/assets/icons/sticky.svg": "71b87789c2877c6e13f7865ee7822f86",
"assets/assets/icons/sunken.svg": "a07cfc124b87344a908f793ef4b5975c",
"assets/assets/icons/swollen.svg": "9f1f15cc45a91c25329679065b26df48",
"assets/assets/icons/wrinkled.svg": "9d086af10ea8bee73f561a0c75bcd529",
"assets/assets/icons/zone.svg": "2b014bbd1d60a38341b3f30b33705985",
"assets/assets/logo.png": "0771fb39d5cb8f9cec325426867f93e2",
"assets/assets/logo.svg": "630f2f5996a9edd51e30162b229ce577",
"assets/assets/mushroom.svg": "a8f700fc655a8123f09c2258d2b64de2",
"assets/assets/ring/c.svg": "e74a2b8c16a04f880994b9e70b5f1b01",
"assets/assets/ring/e.svg": "bd375785708c558668c78b123be5d71a",
"assets/assets/ring/g.svg": "4a3a4ff685c4dd9c7a8eb290f48802b6",
"assets/assets/ring/l.svg": "3091b8c19977256a72a7b762e36c05c5",
"assets/assets/ring/m.svg": "b432b9fe2b8a515a880ea93603cdf834",
"assets/assets/ring/p.svg": "14dc55e2ce72f6b1d9e196aef0344868",
"assets/assets/ring/r.svg": "f03acdab3ad8a2ee1ca6f36ba90f55c7",
"assets/assets/ring/s.svg": "db9ab320c71d2f084b4cc697ba9ab355",
"assets/assets/ring/y.svg": "d7c5e80eea9c70ad89b5c7c310fcdcc2",
"assets/assets/ring/z.svg": "b41c3b95b08b2ea2e5161dd465e03b23",
"assets/assets/Species/Amanita_Family/death-cap.jpg": "6c8ae2e3e30e02f4df750a209832b708",
"assets/assets/Species/Amanita_Family/destroying-angel.jpg": "901dbfe7da3c15a4b9166de74d184e41",
"assets/assets/Species/Amanita_Family/false-death-cap.jpg": "609a6d0084bcdeaa657486314d8dccc1",
"assets/assets/Species/Amanita_Family/false-panther-cap.jpg": "896fcfa9194c539ed0b7d8caa567ba33",
"assets/assets/Species/Amanita_Family/fly-agaric.jpg": "14b6513488b31891e2bd4eedf30ce9c6",
"assets/assets/Species/Amanita_Family/panther-cap.jpg": "aee043849757abf337c82fb6c1a52b39",
"assets/assets/Species/Amanita_Family/tawny-grisette.jpg": "5032cec38c75f2bd1ebef8a71b0b43c4",
"assets/assets/Species/Amanita_Family/the-blusher.jpg": "b78c15072b6533f3f86650e123a4a822",
"assets/assets/Species/Bolbitius_Family/brown-bell-cap.jpg": "1d0ba7695a0d96706fc60fa421c5ad8f",
"assets/assets/Species/Bolbitius_Family/egg-yolk-fungus.jpg": "ebe79c8ac8ec1fe04f5232f4bb709faf",
"assets/assets/Species/Bolbitius_Family/spring-agaric.jpg": "5dc753af8cfb61ac7f3136894243d49a",
"assets/assets/Species/Bolete_Family/bay-bolete.jpg": "448f55c0b91ebee2ff88106f2dcc9bba",
"assets/assets/Species/Bolete_Family/bitter-bolete.jpg": "633fde7204d96367c4f19d254bb4a0db",
"assets/assets/Species/Bolete_Family/brown-birch-bolete.jpg": "142016354fa746f874a0c014b1536ffa",
"assets/assets/Species/Bolete_Family/cep.jpg": "414a35a6aaf33510aff3f69dc4b3a133",
"assets/assets/Species/Bolete_Family/dotted-stemmed-bolete.jpg": "3446f99565d35c14df6e2afa9b6f9a9f",
"assets/assets/Species/Bolete_Family/larch-bolete.jpg": "2dbc5072c8cbedaa60fa85a27961673f",
"assets/assets/Species/Bolete_Family/lurid-bolete.jpg": "a5961669f89237439ddbd4c2232ea300",
"assets/assets/Species/Bolete_Family/orange-birch-bolete.jpg": "35105d6cb08f5062b2ca6d1531b3c260",
"assets/assets/Species/Bolete_Family/parasitic-bolete.jpg": "bed49203b31a602a37a81f81f9625cb3",
"assets/assets/Species/Bolete_Family/peppery-bolete.jpg": "ebbe7041b0fb30036ee6388b5abbdf23",
"assets/assets/Species/Bolete_Family/red-cracked-bolete.jpg": "e0a40f17e60199cf7e6562f3cea70270",
"assets/assets/Species/Bolete_Family/shallow-pored-bolete.jpg": "81d18ee9451924b2c6d28752b53dffce",
"assets/assets/Species/Bolete_Family/slippery-jack.jpg": "4d5f068950858cbce250c2ebeeeb4ac4",
"assets/assets/Species/Bolete_Family/yellow-cracked-bolete.jpg": "e335d933c051d0ab42cb3de9eb5ff8be",
"assets/assets/Species/Bracket_Fungi/brown-goblet.jpg": "aa9a5d22dc29af4a8d287aac2fac458c",
"assets/assets/Species/Bracket_Fungi/dryad's-saddle.jpg": "07d8ee988211e2060376464e7bce7661",
"assets/assets/Species/Bracket_Fungi/elfin's-saddle.jpg": "3c43a099fa5747bf1c877ea1ed1e7fd1",
"assets/assets/Species/Bracket_Fungi/fuzzy-polypore.jpg": "468b76558741eab39c82020e73d30b45",
"assets/assets/Species/Bracket_Fungi/hairy-stereum.jpg": "b30d3cda848c9a67933cd2ff4fc140a9",
"assets/assets/Species/Bracket_Fungi/silver-leaf-fungus.jpg": "2f2a898e8d798b1cc99ec3541a42df94",
"assets/assets/Species/Bracket_Fungi/turban-fungus.jpg": "168603b8e0d8b2bb939b9d1123651736",
"assets/assets/Species/Chanterelle_Family/chanterelle.jpg": "0445f4ff64ee4b3d3e4112cde4c63ce9",
"assets/assets/Species/Chanterelle_Family/horn-of-plenty.jpg": "f14577454ff10321faa4909f309c0a28",
"assets/assets/Species/Chanterelle_Family/tubed-chanterelle.jpg": "7e228760972e8761a3b62ab99cc676c2",
"assets/assets/Species/Cortinarius_Family/blood-red-cortinarius.jpg": "c76f187f7af2dd4c81e35f85afa40a56",
"assets/assets/Species/Cortinarius_Family/common-white-inocybe.jpg": "8f1ca3276aefa2a57e4d69513ea69535",
"assets/assets/Species/Cortinarius_Family/dark-centred-hebeloma.jpeg": "c1c3a82ffab572269077032281561e42",
"assets/assets/Species/Cortinarius_Family/moss-pixy-cap.jpg": "748250600390e4b30b12d976d1cc1c64",
"assets/assets/Species/Cortinarius_Family/poison-pie.jpg": "8dbf77818b4592a0729d993c06871349",
"assets/assets/Species/Cortinarius_Family/purple-cortinarius.jpg": "8cd81105147a880924735ef684ac752f",
"assets/assets/Species/Cortinarius_Family/red-banded-cortinarius.jpg": "03d1c4639a41606c43c406a77e167cf5",
"assets/assets/Species/Cortinarius_Family/red-staining-inocybe.jpg": "49c7a733361a0d3090e105241bfb0602",
"assets/assets/Species/Cortinarius_Family/rusty-wood-rotter.jpg": "c3e25b1861cd7e5fdc5f810e8d0d4e38",
"assets/assets/Species/Cortinarius_Family/spectacular-gymnopile.jpg": "dd51ce80c487bf85ee8d2a5a2120998f",
"assets/assets/Species/Cortinarius_Family/straw-coloured-inocybe.jpg": "fdd6efb0aa176e9025a4834fa47dfd05",
"assets/assets/Species/Crepidotus_Family/soft-slipper-toadstool.jpg": "e5fdbb4598eaae431a2698d9515c0c76",
"assets/assets/Species/Ear-Pick_Family/ear-pick-fungus.jpg": "51ae210f957b588445770b9d819857a4",
"assets/assets/Species/Entoloma_Family/apricot-fungus.jpg": "b99f0f386318a5ebd523565b6cc54280",
"assets/assets/Species/Entoloma_Family/blue-leptonia.jpg": "7aadda7b1f5c1ce0a68594bd42569445",
"assets/assets/Species/Entoloma_Family/livid-entoloma.jpg": "d721d2bf7b5430c7fc34dd51399c5a9a",
"assets/assets/Species/Entoloma_Family/silky-nolanea.jpg": "9bb567e54f047c0b114751257fb934be",
"assets/assets/Species/Entoloma_Family/striated-nolanea.jpg": "5492d006346788bba099c8c03e2327f6",
"assets/assets/Species/Entoloma_Family/the-miller.jpg": "4fac143c12d2850125fb2eeb18df3bff",
"assets/assets/Species/Entoloma_Family/white-leptonia.jpg": "c70ab7adb7b106af2b1a1698c5069f38",
"assets/assets/Species/Hydnum_Family/hedgehog-fungus.jpg": "fea08713b7907d5b33b104bcdc3a520b",
"assets/assets/Species/Ink_Cap_Family/common-crumble-cap.jpg": "8856d1484cf673cf69e076e0f7dce41f",
"assets/assets/Species/Ink_Cap_Family/common-ink-cap.jpg": "93c9806972978be3032c2084fe17c8aa",
"assets/assets/Species/Ink_Cap_Family/egg-shell-toadstool.jpg": "7c067e3713f5f6c392f23eee4cfd291c",
"assets/assets/Species/Ink_Cap_Family/fairies'-bonnets.jpg": "8a17bff333a7e5c9e0f08d7696c84ab0",
"assets/assets/Species/Ink_Cap_Family/fairy-parasol.jpg": "239c98bf9363c3bede11a4fb2d8ef35b",
"assets/assets/Species/Ink_Cap_Family/glistening-ink-cap.jpg": "653dab02305b883eb52c1bc651a48f2f",
"assets/assets/Species/Ink_Cap_Family/hay-cap.jpg": "1df595824881d758500289050921c34b",
"assets/assets/Species/Ink_Cap_Family/magpie-ink-cap.jpg": "ea79107c0d3fb641efcca543609e8172",
"assets/assets/Species/Ink_Cap_Family/petticoat-fungus.jpg": "85dffd33dc28d9741d9a4ae305574c64",
"assets/assets/Species/Ink_Cap_Family/rusty-carpet-ink-cap.jpg": "b697972f81492d42b9508b0fb9e92899",
"assets/assets/Species/Ink_Cap_Family/shaggy-ink-cap.jpg": "d82b992688087a719ca3b10b022fa059",
"assets/assets/Species/Ink_Cap_Family/two-toned-crumble-cap.jpg": "e7737512aaa72073740030ba7d515131",
"assets/assets/Species/Ink_Cap_Family/weeping-widow.jpg": "3023424760bc086403fabf33b69a9d58",
"assets/assets/Species/Jelly_Discs_Family/jelly-babies.jpg": "d6adbd48cb3f863a2f81ef62578646fd",
"assets/assets/Species/Lepiota_Family/parasol-mushroom.jpg": "317cbcd8980a0f69728238025b491a75",
"assets/assets/Species/Lepiota_Family/shaggy-parasol.jpg": "d5909f075b8bcf3176af1d3a5d4ee99d",
"assets/assets/Species/Lepiota_Family/stinking-parasol.jpg": "74669eb1912ea47505c21ce329e89f8f",
"assets/assets/Species/Morel_Family/common-morel.jpg": "769ce11a6f83261ae05fff2af6b08421",
"assets/assets/Species/Mushroom_Family/bleeding-brown-mushroom.jpg": "73423481b66cd34308b25eeaf963eae5",
"assets/assets/Species/Mushroom_Family/cultivated-mushroom.jpg": "ffddb592706dc0a3a1377a04ff5078e9",
"assets/assets/Species/Mushroom_Family/field-mushroom.jpg": "eb3880f919218ffec2993b125f032e55",
"assets/assets/Species/Mushroom_Family/horse-mushroom.jpg": "2299c63c1c17b1af69dd41e065a3cfb9",
"assets/assets/Species/Mushroom_Family/yellow-staining-mushroom.jpg": "9761f073d9e9a91196473ea9cf906446",
"assets/assets/Species/Oyster_Mushroom_Family/branched-oyster-mushroom.jpg": "a523af42c3cf21e9a8207499186cd867",
"assets/assets/Species/Oyster_Mushroom_Family/oyster-mushroom.jpg": "ff60f8e748307e219d8ee8eded79db68",
"assets/assets/Species/Paxillus_Family/brown-roll-rim.jpg": "5ee4c005d1f217718c0c6863f5eaf2ab",
"assets/assets/Species/Paxillus_Family/false-chanterelle.jpg": "19763abe0020b31fd54efd9a156a7875",
"assets/assets/Species/Paxillus_Family/velvet-roll-rim.jpg": "f6f920bf77a483dc98e459e3f41efbf1",
"assets/assets/Species/Pluteus_Family/fawn-pluteus.jpg": "813ece403b53e91dfc26c3eed961b422",
"assets/assets/Species/Pluteus_Family/veined-pluteus.jpg": "4d11a728ede50175ee5010da0c7aed22",
"assets/assets/Species/Russula_Family/bare-toothed-russula.jpg": "2f98cdff161b7b2c18ec1a846667f052",
"assets/assets/Species/Russula_Family/beechwood-sickener.jpg": "ab8cf4f1d96b3892f6b3a935a0d1840c",
"assets/assets/Species/Russula_Family/birch-russula.jpg": "7b197673723c62e4a7146626326e9add",
"assets/assets/Species/Russula_Family/blackening-russula.jpg": "0870f2683c6606844798ee34915e4e96",
"assets/assets/Species/Russula_Family/blackish-purple-russula.jpg": "82806b5a02d380eb8533845c1bca2e41",
"assets/assets/Species/Russula_Family/coconut-scented-milk-cap.jpg": "b1a646a1f7941299e8786d0db2633116",
"assets/assets/Species/Russula_Family/common-yellow-russula.jpg": "345f24029178f5c0c68a040fdc4120fe",
"assets/assets/Species/Russula_Family/crab-scented-russula.jpg": "59b9d0dbe29495f663473e5a37c20c04",
"assets/assets/Species/Russula_Family/fleecy-milk-cap.jpg": "b97887b0f6e16e400ef4b84630587c4c",
"assets/assets/Species/Russula_Family/fragile-russula.jpg": "bfdf6207891ab3789bb150cb5d04472c",
"assets/assets/Species/Russula_Family/geranium-scented-russula.jpg": "461faadf5bee10444b05ef1955280944",
"assets/assets/Species/Russula_Family/grass-green-russula.jpg": "a53f644ba3047ece8316e8a9d37a9380",
"assets/assets/Species/Russula_Family/oak-milk-cap.jpg": "9d1971cdf2d3229c64f9922adbb4038a",
"assets/assets/Species/Russula_Family/peppery-milk-cap.jpg": "4bce85d4501314193e043e8e2be56834",
"assets/assets/Species/Russula_Family/rufous-milk-cap.jpg": "ca79c6c613f3782329f022f892515b04",
"assets/assets/Species/Russula_Family/saffron-milk-cap.jpg": "a47d4e078951dc71f3087efb0c691fc0",
"assets/assets/Species/Russula_Family/slimy-milk-cap.jpg": "7650e94df7f3e9b07f0696e0772a5ca3",
"assets/assets/Species/Russula_Family/small-brown-milk-cap.jpg": "9f56d70d5b6f1bb7ec33ef61da803b94",
"assets/assets/Species/Russula_Family/spruce-milk-cap.jpeg": "a47d4e078951dc71f3087efb0c691fc0",
"assets/assets/Species/Russula_Family/stinking-russula.jpg": "13896e4fdbb0ed1dd2497dd3feeaa654",
"assets/assets/Species/Russula_Family/sweet-milk-cap.jpg": "463705198a108ab37b8240c7c4d1520b",
"assets/assets/Species/Russula_Family/the-charcoal-burner.jpg": "c8ce21b28adc557630cc46919ce18725",
"assets/assets/Species/Russula_Family/the-sickener.jpg": "f9427912e106f315e647ed4fdb94bc0b",
"assets/assets/Species/Russula_Family/ugly-milk-cap.jpg": "7e57a4747a537242d76b764dd0590abe",
"assets/assets/Species/Russula_Family/woolly-milk-cap.jpg": "e9323beeeb89bd1f969fd896302eabb0",
"assets/assets/Species/Russula_Family/yellow-gilled-russula.jpg": "72fd5545d5ba8248c52c78a6d27c84ef",
"assets/assets/Species/Russula_Family/yellow-swamp-russula.jpg": "953facc7f1a602cc5086b943042ba7f2",
"assets/assets/Species/Saddle-Cup_Family/white-saddle.jpg": "6a17a978c99abaa431b9f810cf2f293c",
"assets/assets/Species/Stropharia_Family/brick-caps.jpg": "9b848d61fdded3d54abde091ecf38db4",
"assets/assets/Species/Stropharia_Family/brown-stew-fungus.jpg": "433640459de2487aad6024723dc6f842",
"assets/assets/Species/Stropharia_Family/charcoal-pholiota.jpg": "7a6c1eea807965d03b6f50983e71c139",
"assets/assets/Species/Stropharia_Family/dung-roundhead.jpg": "2b0564fd0b6350ecc6876251e1e60ba3",
"assets/assets/Species/Stropharia_Family/magic-mushroom.jpg": "8033019a8ac097e01d9f3fc1f192fd65",
"assets/assets/Species/Stropharia_Family/shaggy-pholiota.jpg": "65299614a7a3614f1695182f56a484f8",
"assets/assets/Species/Stropharia_Family/sulphur-tuft.jpg": "a9573d4c425041f11fa2e55c0e783938",
"assets/assets/Species/Stropharia_Family/verdigris-toadstool.jpg": "2ac09a81f42ca2506fea4534491dfed0",
"assets/assets/Species/Tricholoma_Family/amethyst-deceiver.jpg": "97102ffcc827fe97044d42e470c52c0e",
"assets/assets/Species/Tricholoma_Family/aniseed-funnel-cap.jpg": "f28abab284101386ae34533213c262b2",
"assets/assets/Species/Tricholoma_Family/bonnet-bell-cap.jpg": "5c50dd0640336fd0da75c2224512c1dc",
"assets/assets/Species/Tricholoma_Family/bulbous-honey-fungus.jpg": "1cf602a2451ae16a205ef0a2439aa827",
"assets/assets/Species/Tricholoma_Family/changeable-melanoleuca.jpg": "db8f0e4c0b7c63ff068738137ebed1bd",
"assets/assets/Species/Tricholoma_Family/clouded-agaric.jpg": "5ba9cba1022096a6c9fa7dbff2953273",
"assets/assets/Species/Tricholoma_Family/club-footed-funnel-cap.jpg": "cd07761961662b7a8a5c43934dd62365",
"assets/assets/Species/Tricholoma_Family/clustered-brown-cap.jpg": "d4d4810f7a55696af71208cbc1ee46b0",
"assets/assets/Species/Tricholoma_Family/clustered-tough-shank.jpg": "b23b3856ac895b25fd08c4e3e87320e7",
"assets/assets/Species/Tricholoma_Family/common-funnel-cap.jpg": "30f91cd67422032be5fc7bc5030734a7",
"assets/assets/Species/Tricholoma_Family/fairy-ring-champignon.jpg": "34677d71d5a924b0fe44397559120caf",
"assets/assets/Species/Tricholoma_Family/field-blewit.jpg": "28bd7db0cf688de2cc0d7a52d9b3d43d",
"assets/assets/Species/Tricholoma_Family/greasy-tough-shank.jpg": "22fe81fe32c8be2163560f5df4062e20",
"assets/assets/Species/Tricholoma_Family/grey-tricholoma.jpg": "5581cf106d2afd73a8bb2cea5fba4f88",
"assets/assets/Species/Tricholoma_Family/honey-fungus.jpg": "cca9556d4e449d77f313f31f5fc5db47",
"assets/assets/Species/Tricholoma_Family/horse-hair-hungus.jpg": "4a75e41b42532442e5fc7e6d6a9f8e59",
"assets/assets/Species/Tricholoma_Family/ivory-clitocybe.jpg": "c4dbcdbf1c229b9a9f9c358f1cb2bc12",
"assets/assets/Species/Tricholoma_Family/lilac-bell-cap.jpg": "71f80c1ad397b69e663290efecb0dd8a",
"assets/assets/Species/Tricholoma_Family/little-wheel-fungus.jpg": "da09d36a787a02f936103a17981c489c",
"assets/assets/Species/Tricholoma_Family/milky-bell-cap.jpg": "d9ffa967907b5026e67ac8ec8cfeb3ff",
"assets/assets/Species/Tricholoma_Family/olive-brown-panellus.jpg": "cc49418a7a3c5fd25826824843039709",
"assets/assets/Species/Tricholoma_Family/orange-bell-cap.jpg": "1f5206a2a152c9efdb08e6eb7a3ff182",
"assets/assets/Species/Tricholoma_Family/orange-moss-agaric.jpg": "7d2576171a2fd34b8be0d65dceaa882d",
"assets/assets/Species/Tricholoma_Family/plums-and-custard.jpg": "4513ef298249ff8444e502a93bb5e448",
"assets/assets/Species/Tricholoma_Family/porcelain-mushroom.jpg": "1cd3eca6b9f43be01697659e6028da3f",
"assets/assets/Species/Tricholoma_Family/rooting-shank.jpg": "15788be493988cf11ae21ab786474540",
"assets/assets/Species/Tricholoma_Family/russet-tough-shank.jpg": "e6fb9fa7d54d4c1062d537e50ab81686",
"assets/assets/Species/Tricholoma_Family/saffron-parasol.jpg": "504d1aa438d42957bc1b59d695c0492f",
"assets/assets/Species/Tricholoma_Family/scaly-tricholoma.jpg": "b1bcc730a75615413549690b1f59a764",
"assets/assets/Species/Tricholoma_Family/small-bleeding-bell-cap.jpg": "b6f062a5446da75b449bae8df2c1699e",
"assets/assets/Species/Tricholoma_Family/soap-scented-tricholoma.jpg": "ea4844f1575fada7b6a1d4b01911c0f1",
"assets/assets/Species/Tricholoma_Family/spotted-toughshank.jpg": "b402d636c77d04d3ab4cefd6cd24dcbc",
"assets/assets/Species/Tricholoma_Family/st-george's-mushroom.jpg": "2c1ecc58eaaae35ee669e74b5b334d81",
"assets/assets/Species/Tricholoma_Family/stump-bell-cap.jpg": "22065e3165f12439b4fc8e1671633bb5",
"assets/assets/Species/Tricholoma_Family/sulphur-tricholoma.jpg": "375a531000f22a4210990370104fd507",
"assets/assets/Species/Tricholoma_Family/the-deceiver.jpg": "85d8748c06d926384774724eaa6e3a85",
"assets/assets/Species/Tricholoma_Family/tufted-bell-cap.jpg": "653dab02305b883eb52c1bc651a48f2f",
"assets/assets/Species/Tricholoma_Family/umbrella-navel-cap.jpg": "4c430eac577bf20e3fc5ec6adc7f47ba",
"assets/assets/Species/Tricholoma_Family/velvet-shank.jpg": "6fc1cb954c404347ecbfbcffdef68b4f",
"assets/assets/Species/Tricholoma_Family/wood-blewit.jpg": "f3ec5ad525988cc5d14ae37c5b3c4d65",
"assets/assets/Species/Tricholoma_Family/wood-woolly-foot.jpg": "f486ce12d2df82d1618d302132f3843e",
"assets/assets/Species/Tricholoma_Family/yellow-brown-tricholoma.jpg": "8ed9c7eb71f90f87bd0811cbf8891739",
"assets/assets/Species/Tricholoma_Family/yellow-stemmed-bell-cap.jpg": "ca703753a029f0a29757c5c1cd49247c",
"assets/assets/Species/Wax_Gill_Family/blackening-wax-cap.jpg": "16ec571712206cf8584e181b2c67a648",
"assets/assets/Species/Wax_Gill_Family/herald-of-winter.jpg": "db27f972f15bb72862c57ed4473a2390",
"assets/assets/Species/Wax_Gill_Family/hygrocybe-flavescens.jpg": "74a23e4d532787054ef0e94c1fe640d6",
"assets/assets/Species/Wax_Gill_Family/ivory-wax-cap.jpg": "3c6e7a01706c6a2b904415894395883c",
"assets/assets/Species/Wax_Gill_Family/meadow-wax-cap.jpg": "21e5114c35e59586bdd0c44e07c4ecf3",
"assets/assets/Species/Wax_Gill_Family/orange-red-wax-cap.jpg": "7cdf705accaa67ac361b31a0cf781a6e",
"assets/assets/Species/Wax_Gill_Family/parrot-wax-cap.jpg": "baef8f6c53c24e7f2b84f6d5da324641",
"assets/assets/Species/Wax_Gill_Family/scarlet-hood.jpg": "ff643e0e5c992065dbeb06b2753fd0e9",
"assets/assets/species_descriptions.json": "2ff19a67a799e6213fc646ccac8bea3d",
"assets/assets/stem/b.svg": "a6f80d5951511056ccfced64f8ea1dd4",
"assets/assets/stem/c.svg": "72691602491620feb2533aac0298c019",
"assets/assets/stem/e.svg": "c0ff68845f86c9e1034bd993398adabb",
"assets/assets/stem/r.svg": "4e719caaa61a3d6d18ad1ecf0fb98f99",
"assets/assets/stem/s.svg": "f0adbaee970391cbdd22b86cc6ddb366",
"assets/assets/stem/texture/dark-bg/e_b.png": "cf30fdf7b4c9ed69d7d6c703ec96d282",
"assets/assets/stem/texture/dark-bg/e_c.png": "2bc2f2a4165c12c2c7bbef249f26218f",
"assets/assets/stem/texture/dark-bg/e_e.png": "dce04579e03e16708ad2077f7d130a00",
"assets/assets/stem/texture/dark-bg/e_r.png": "d773b3e365a691022cd964a97f2ae046",
"assets/assets/stem/texture/dark-bg/e_s.png": "a0eb3c9437dd9f794fee3df8cab4b301",
"assets/assets/stem/texture/dark-bg/e_U.png": "a40ceb6c78c07f9d4abf65603a7242df",
"assets/assets/stem/texture/dark-bg/e_z.png": "9a104c1c50d8a17270e65046823da139",
"assets/assets/stem/texture/dark-bg/g_b.png": "e5038c5caf1e615f903a774c05fda452",
"assets/assets/stem/texture/dark-bg/g_c.png": "c15593a85388a4920720a7b194d53a4a",
"assets/assets/stem/texture/dark-bg/g_e.png": "89ed36eb9ee12f8c6468ab63376f4520",
"assets/assets/stem/texture/dark-bg/g_r.png": "0d24311c3b847d5816fa99f45f71608b",
"assets/assets/stem/texture/dark-bg/g_s.png": "a4fd6e19930c03a79bfb914f8d850dfb",
"assets/assets/stem/texture/dark-bg/g_u.png": "a2310312e4ca7506c707898687c9ff82",
"assets/assets/stem/texture/dark-bg/g_z.png": "e8f3863f12df7d5a5fc6f60b0fd40dfb",
"assets/assets/stem/texture/dark-bg/h_b.png": "d7a068273d6c4d9987db15f19eadc57c",
"assets/assets/stem/texture/dark-bg/h_c.png": "7d516198ec19ad0b67f832cbf8308c10",
"assets/assets/stem/texture/dark-bg/h_e.png": "844e6ad2bd03089dcf5076c3b1515275",
"assets/assets/stem/texture/dark-bg/h_r.png": "05bd2dcd27a1900e1186da04eef4af72",
"assets/assets/stem/texture/dark-bg/h_s.png": "18f86cf9a6194b10bd8ab1b1a301eaa5",
"assets/assets/stem/texture/dark-bg/h_u.png": "18f86cf9a6194b10bd8ab1b1a301eaa5",
"assets/assets/stem/texture/dark-bg/h_z.png": "fbc7f9ea4db7d7a8b7c7353fb04d6333",
"assets/assets/stem/texture/dark-bg/i_b.png": "cce6c78a9539f8cf03399a795ab9dc61",
"assets/assets/stem/texture/dark-bg/i_c.png": "18b097e181146036b299be5983ab2316",
"assets/assets/stem/texture/dark-bg/i_e.png": "22dab90e32a92560ece902c6125a1c59",
"assets/assets/stem/texture/dark-bg/i_r.png": "4dd09f3211a4584a74df407fdf3ca94c",
"assets/assets/stem/texture/dark-bg/i_s.png": "4d35dfe10cae16563f7547731db448db",
"assets/assets/stem/texture/dark-bg/i_u.png": "4d35dfe10cae16563f7547731db448db",
"assets/assets/stem/texture/dark-bg/i_z.png": "095007997458deba43184bff98dcd792",
"assets/assets/stem/texture/dark-bg/k_b.png": "a03fec292f8e21b1e70d65c71037a463",
"assets/assets/stem/texture/dark-bg/k_c.png": "641f40621a2f6dc0336e02325a7b6fe6",
"assets/assets/stem/texture/dark-bg/k_e.png": "3862bed82d7e0566893109a124a8aa01",
"assets/assets/stem/texture/dark-bg/k_r.png": "5e346b20f4611a70f564ba57f3a2870d",
"assets/assets/stem/texture/dark-bg/k_s.png": "4300fb4af3dc6ae3721b0feb37e22c73",
"assets/assets/stem/texture/dark-bg/k_u.png": "4300fb4af3dc6ae3721b0feb37e22c73",
"assets/assets/stem/texture/dark-bg/k_z.png": "449d7ab67dc237200b38e6e8db66e163",
"assets/assets/stem/texture/dark-bg/l_b.png": "b7af49a8d3c2a2517f45cab5e46482a1",
"assets/assets/stem/texture/dark-bg/l_c.png": "ac832741616cd54a3cb234b2c1bf2bab",
"assets/assets/stem/texture/dark-bg/l_e.png": "7db3634d39f7e713008ba5f68f028f84",
"assets/assets/stem/texture/dark-bg/l_r.png": "9ba095f9a14714409c9628914bdaaad1",
"assets/assets/stem/texture/dark-bg/l_s.png": "dbe7631e902e6b9b6ffc837e2475b862",
"assets/assets/stem/texture/dark-bg/l_u.png": "dbe7631e902e6b9b6ffc837e2475b862",
"assets/assets/stem/texture/dark-bg/l_z.png": "470a99bd2264680ea543a3f965922d4d",
"assets/assets/stem/texture/dark-bg/s_b.png": "303cabd3ab730bb64b67b93d525c7df0",
"assets/assets/stem/texture/dark-bg/s_c.png": "941956b766f457bac97de252e77e5de7",
"assets/assets/stem/texture/dark-bg/s_e.png": "f84496aa33af4cf9836d19c69baa01bf",
"assets/assets/stem/texture/dark-bg/s_r.png": "e479f6464736ef10569ab902e7cd6952",
"assets/assets/stem/texture/dark-bg/s_s.png": "429d2b6d0f77c87216c5e92b45660cee",
"assets/assets/stem/texture/dark-bg/s_u.png": "bf3ddaf460c3f9517b457499b382c7ba",
"assets/assets/stem/texture/dark-bg/s_z.png": "bf3ddaf460c3f9517b457499b382c7ba",
"assets/assets/stem/texture/dark-bg/t_b.png": "1faf203c059dbd82df53aabed84443dd",
"assets/assets/stem/texture/dark-bg/t_c.png": "e585710691b81d3683d064e5160762fa",
"assets/assets/stem/texture/dark-bg/t_e.png": "a228109fefc6dde471865801d0600d32",
"assets/assets/stem/texture/dark-bg/t_r.png": "fd9b130e8322c3a86e6fafcdfbecd86e",
"assets/assets/stem/texture/dark-bg/t_s.png": "bb99c5e81286ca0eddca7b873502f250",
"assets/assets/stem/texture/dark-bg/t_u.png": "174beda83ae46c83ad076edf78b8a165",
"assets/assets/stem/texture/dark-bg/t_z.png": "374c938797351294d4fda9590a4db5cb",
"assets/assets/stem/texture/dark-bg/w_b.png": "a03b9317e1d473f1e86c3a326d0dfceb",
"assets/assets/stem/texture/dark-bg/w_c.png": "6aa0f67c11cd4de2ee78bc80afb926a8",
"assets/assets/stem/texture/dark-bg/w_e.png": "717ce5687375c9f196390b4ccff710cb",
"assets/assets/stem/texture/dark-bg/w_r.png": "f7e68e636239b8f5e0b7736ea4229e0c",
"assets/assets/stem/texture/dark-bg/w_s.png": "5a1fc90084a085e8ea52efb904d17417",
"assets/assets/stem/texture/dark-bg/w_u.png": "5a1fc90084a085e8ea52efb904d17417",
"assets/assets/stem/texture/dark-bg/w_z.png": "0294c97c9b1a442c0079be44c0e233c2",
"assets/assets/stem/texture/dark-bg/y_b.png": "c559aa016b89e537b4e0669a080962f6",
"assets/assets/stem/texture/dark-bg/y_c.png": "2c4fa08fe1dfe1789c6bc9ff4705e905",
"assets/assets/stem/texture/dark-bg/y_e.png": "e2b3c5faae53f38f9529f5bf60c078a1",
"assets/assets/stem/texture/dark-bg/y_r.png": "3024390fe1eea578cf3b336b659505a1",
"assets/assets/stem/texture/dark-bg/y_s.png": "aa86df3ae68d753f4ae3f6b038341afa",
"assets/assets/stem/texture/dark-bg/y_u.png": "aa86df3ae68d753f4ae3f6b038341afa",
"assets/assets/stem/texture/dark-bg/y_z.png": "0ece84bb485278f420bc0c0e129a5947",
"assets/assets/stem/texture/light-bg/e_b.png": "f772fde8a966df7f481298f09372452e",
"assets/assets/stem/texture/light-bg/e_c.png": "8b943c3b07285a8dca2f9e2e2f23a24e",
"assets/assets/stem/texture/light-bg/e_e.png": "03e1da075a303ed868884504934a0bdf",
"assets/assets/stem/texture/light-bg/e_r.png": "75c38e2a5a272987f721659df799bb3c",
"assets/assets/stem/texture/light-bg/e_s.png": "169dab0cc162ec7866129b894df8b021",
"assets/assets/stem/texture/light-bg/e_u.png": "169dab0cc162ec7866129b894df8b021",
"assets/assets/stem/texture/light-bg/e_z.png": "c9942b1bcb005b45e538499ac58dbfca",
"assets/assets/stem/texture/light-bg/g_b.png": "007ddaf3216caddbbb29d6b67779033a",
"assets/assets/stem/texture/light-bg/g_c.png": "126f9ed6816bef917c25215a8a4ae772",
"assets/assets/stem/texture/light-bg/g_e.png": "aeea6df2e819ea6d6303a35105335a45",
"assets/assets/stem/texture/light-bg/g_r.png": "cd212ca0702e069f136c776718b23f0a",
"assets/assets/stem/texture/light-bg/g_s.png": "09f1ec1a4c7b4372ab21d52ea74368b9",
"assets/assets/stem/texture/light-bg/g_u.png": "4a94e3962e58c803cb6353d03be3869d",
"assets/assets/stem/texture/light-bg/g_z.png": "6ea584f9ec2a5a000a1f0566637b6080",
"assets/assets/stem/texture/light-bg/h_b.png": "05853de3bb03ae2976b8a664da7c52fa",
"assets/assets/stem/texture/light-bg/h_c.png": "c4f5f1b0a32cf30b333e338d1f592f8a",
"assets/assets/stem/texture/light-bg/h_e.png": "ae4eaf2f1c38c4c2794b8da64e271711",
"assets/assets/stem/texture/light-bg/h_r.png": "ef4e498e4cc8aa2f677d851a82acce6e",
"assets/assets/stem/texture/light-bg/h_s.png": "148756e1a957800d5d728b52fe5abe8a",
"assets/assets/stem/texture/light-bg/h_u.png": "ae4eaf2f1c38c4c2794b8da64e271711",
"assets/assets/stem/texture/light-bg/h_z.png": "59938f5e9222e202685cf2e6c5615224",
"assets/assets/stem/texture/light-bg/i_b.png": "e6aa75c399f95df8f1a8e01ff37d5cf3",
"assets/assets/stem/texture/light-bg/i_c.png": "749a4cfcf7041058c043044cd298771a",
"assets/assets/stem/texture/light-bg/i_e.png": "95239475076f7e9b2aac8a3152f7be4b",
"assets/assets/stem/texture/light-bg/i_r.png": "57957513d783d57e1252c2d507eeac5b",
"assets/assets/stem/texture/light-bg/i_s.png": "9e7ee5f5a719fe31e7e30d8b825b7407",
"assets/assets/stem/texture/light-bg/i_u.png": "9e7ee5f5a719fe31e7e30d8b825b7407",
"assets/assets/stem/texture/light-bg/i_z.png": "3fe8a28f08e81fb08bede3017754b3c5",
"assets/assets/stem/texture/light-bg/k_b.png": "d7111feae1c3e1211014c9189bbf87f9",
"assets/assets/stem/texture/light-bg/k_c.png": "b5a0822fdfddf9d476dd5dd63133393f",
"assets/assets/stem/texture/light-bg/k_e.png": "f25527289b27f89a0ed5fea6db0a21e7",
"assets/assets/stem/texture/light-bg/k_r.png": "8cff6cd6118e0e698a48dd80e63e639c",
"assets/assets/stem/texture/light-bg/k_s.png": "4ed35718c8556264f673e6d7b64206d0",
"assets/assets/stem/texture/light-bg/k_u.png": "4ed35718c8556264f673e6d7b64206d0",
"assets/assets/stem/texture/light-bg/k_z.png": "449d7ab67dc237200b38e6e8db66e163",
"assets/assets/stem/texture/light-bg/l_b.png": "4710d5b45faf2aa8fcadceeb8995e840",
"assets/assets/stem/texture/light-bg/l_c.png": "65587c2f078f38bce9651522acb5227f",
"assets/assets/stem/texture/light-bg/l_e.png": "1bcbf212e11b8d42efe53992e3d483f1",
"assets/assets/stem/texture/light-bg/l_r.png": "afe3b8a47c35dc3c904558ad24f58253",
"assets/assets/stem/texture/light-bg/l_s.png": "89d5f6c8ffb0814776170b0ad3398d7e",
"assets/assets/stem/texture/light-bg/l_u.png": "89d5f6c8ffb0814776170b0ad3398d7e",
"assets/assets/stem/texture/light-bg/l_z.png": "1ae877f3292c743d1c520cf3e74a1647",
"assets/assets/stem/texture/light-bg/s_b.png": "303cabd3ab730bb64b67b93d525c7df0",
"assets/assets/stem/texture/light-bg/s_c.png": "941956b766f457bac97de252e77e5de7",
"assets/assets/stem/texture/light-bg/s_e.png": "f84496aa33af4cf9836d19c69baa01bf",
"assets/assets/stem/texture/light-bg/s_r.png": "e479f6464736ef10569ab902e7cd6952",
"assets/assets/stem/texture/light-bg/s_s.png": "429d2b6d0f77c87216c5e92b45660cee",
"assets/assets/stem/texture/light-bg/s_u.png": "bf3ddaf460c3f9517b457499b382c7ba",
"assets/assets/stem/texture/light-bg/s_z.png": "bf3ddaf460c3f9517b457499b382c7ba",
"assets/assets/stem/texture/light-bg/t_b.png": "7f573f5e14a7f4896a011959086951c7",
"assets/assets/stem/texture/light-bg/t_c.png": "20b96aef08fe18d4e9fa2b41afec6068",
"assets/assets/stem/texture/light-bg/t_e.png": "791c4fd01ecf3d24d1c17b17317b43a6",
"assets/assets/stem/texture/light-bg/t_r.png": "9c8d4c6b693eaa1c7060fe76df531871",
"assets/assets/stem/texture/light-bg/t_s.png": "fa7fcfeea22d2ddbc48486df23f0e651",
"assets/assets/stem/texture/light-bg/t_u.png": "954a970fad2490e3a0a90d8ab827f994",
"assets/assets/stem/texture/light-bg/t_z.png": "fd82e54257cda8dc6f25485a53076daf",
"assets/assets/stem/texture/light-bg/w_b.png": "856ac6b6db69bbc7cc66723e299b1fa5",
"assets/assets/stem/texture/light-bg/w_c.png": "da48b0a571e8015a857b7bdc9224f34e",
"assets/assets/stem/texture/light-bg/w_e.png": "c7ce6972ba4ed1614cdb2c33b04c19f2",
"assets/assets/stem/texture/light-bg/w_r.png": "439707ff6be6383bb32b3fdbad55e680",
"assets/assets/stem/texture/light-bg/w_s.png": "bf9330ce71e594e7e4ce3b414f01081a",
"assets/assets/stem/texture/light-bg/w_u.png": "bf9330ce71e594e7e4ce3b414f01081a",
"assets/assets/stem/texture/light-bg/w_z.png": "1ae877f3292c743d1c520cf3e74a1647",
"assets/assets/stem/texture/light-bg/y_b.png": "01724a05cad8b05853161ee621de29e1",
"assets/assets/stem/texture/light-bg/y_c.png": "72764fb566fb5a29b0bf83405fc205b2",
"assets/assets/stem/texture/light-bg/y_e.png": "bed0f5b5427750b65388939d3f30a8f6",
"assets/assets/stem/texture/light-bg/y_r.png": "264beea9646ebde8fb05057e2ee114df",
"assets/assets/stem/texture/light-bg/y_s.png": "81f3268462fcf4622abba36722e5be2b",
"assets/assets/stem/texture/light-bg/y_u.png": "002bbbd28cb98785547f282faa4659e6",
"assets/assets/stem/texture/light-bg/y_z.png": "46d042cfe85e2f3cc53941c6d7c9d139",
"assets/assets/stem/u.svg": "833d8fbcf02e8e5c9e9ea5e4e2e92ba1",
"assets/assets/stem/z.svg": "5e3c63b90c7edb12ac8ef5aff9c91eb2",
"assets/assets/tutorial/tutorial-1.svg": "76ab352aae478aaaf9c37076c127701d",
"assets/assets/tutorial/tutorial-2.svg": "11586643e0a597ee9b5b40cba62a2b96",
"assets/assets/tutorial/tutorial-3.svg": "e56dc847c874427692a179aaf46107b2",
"assets/assets/tutorial/tutorial-4.png": "9bc4f63b2725c2dee27432096905ee2c",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/NOTICES": "0a5fc0f04a72033e6253d90bc10ee495",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "5b3a8f677696a3987a68746951835b5b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "3716826bb9fc4f409a5251fa3b8fef43",
"/": "3716826bb9fc4f409a5251fa3b8fef43",
"main.dart.js": "ea9ef54540bc814a72b4e8e70bccfdd9",
"manifest.json": "5f18c7a8cc5833aecaecb1060627e840",
"version.json": "d0ef1a94f0dd83de53247c4f5338759b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
