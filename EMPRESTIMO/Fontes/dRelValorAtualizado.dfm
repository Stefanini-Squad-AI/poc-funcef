inherited dtmRelValorAtualizado: TdtmRelValorAtualizado
  Left = 598
  Top = 248
  Width = 293
  Height = 182
  Caption = 'dRelMovContr'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 56
    object pplfExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplfExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  inherited dsExemplo: TwwDataSource
    Left = 24
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 24
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplValorAtualizado: TppBDEPipeline
    DataSource = dtsValorAtualizado
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 112
    Top = 54
    object pplfValorAtualizadoppField1: TppField
      FieldAlias = 'ITEDESCRICAO'
      FieldName = 'ITEDESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField2: TppField
      FieldAlias = 'EVENTO'
      FieldName = 'EVENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField3: TppField
      FieldAlias = 'ANOMES'
      FieldName = 'ANOMES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField4: TppField
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField5: TppField
      FieldAlias = 'HMETIPOMOV'
      FieldName = 'HMETIPOMOV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField6: TppField
      FieldAlias = 'IDITEMEMPTMO'
      FieldName = 'IDITEMEMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField7: TppField
      FieldAlias = 'HMEANOCOMPETENCIA'
      FieldName = 'HMEANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField8: TppField
      FieldAlias = 'HMEMESCOMPETENCIA'
      FieldName = 'HMEMESCOMPETENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField9: TppField
      FieldAlias = 'HMEDATAPREVISTA'
      FieldName = 'HMEDATAPREVISTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField10: TppField
      FieldAlias = 'HMEVLRPREVISTO'
      FieldName = 'HMEVLRPREVISTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField11: TppField
      FieldAlias = 'HMEPARCELAALT'
      FieldName = 'HMEPARCELAALT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField12: TppField
      FieldAlias = 'HMENUMPARCELAS'
      FieldName = 'HMENUMPARCELAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField13: TppField
      FieldAlias = 'HMESEQCOBRANCA'
      FieldName = 'HMESEQCOBRANCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField14: TppField
      FieldAlias = 'HMESALDODEV'
      FieldName = 'HMESALDODEV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField15: TppField
      FieldAlias = 'HMETXJUROS'
      FieldName = 'HMETXJUROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField16: TppField
      FieldAlias = 'VLR_ENCARGOS'
      FieldName = 'VLR_ENCARGOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField17: TppField
      FieldAlias = 'VLR_ATUALIZADO'
      FieldName = 'VLR_ATUALIZADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField18: TppField
      FieldAlias = 'VLR_CORRECAO'
      FieldName = 'VLR_CORRECAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField19: TppField
      FieldAlias = 'VLR_MULTA'
      FieldName = 'VLR_MULTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField20: TppField
      FieldAlias = 'VLR_JUROSMORA'
      FieldName = 'VLR_JUROSMORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField21: TppField
      FieldAlias = 'VLR_JUROSREMUNERA'
      FieldName = 'VLR_JUROSREMUNERA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField22: TppField
      FieldAlias = 'PARCELAS'
      FieldName = 'PARCELAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField23: TppField
      FieldAlias = 'HMEPARCELA'
      FieldName = 'HMEPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField24: TppField
      FieldAlias = 'TSEDESCRICAO'
      FieldName = 'TSEDESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField25: TppField
      FieldAlias = 'TAXA'
      FieldName = 'TAXA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField26: TppField
      FieldAlias = 'PRAZO'
      FieldName = 'PRAZO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField27: TppField
      FieldAlias = 'DATACREDITO'
      FieldName = 'DATACREDITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField28: TppField
      FieldAlias = 'INDICE'
      FieldName = 'INDICE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField29: TppField
      FieldAlias = 'VLRFGQC'
      FieldName = 'VLRFGQC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField30: TppField
      FieldAlias = 'TOTALDEVIDO'
      FieldName = 'TOTALDEVIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField31: TppField
      FieldAlias = 'VLRATUALIZADO'
      FieldName = 'VLRATUALIZADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField32: TppField
      FieldAlias = 'VLRDEVVENCIDO'
      FieldName = 'VLRDEVVENCIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField33: TppField
      FieldAlias = 'VLRDEVVENCER'
      FieldName = 'VLRDEVVENCER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField34: TppField
      FieldAlias = 'QTDEPRESTACOES'
      FieldName = 'QTDEPRESTACOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField35: TppField
      FieldAlias = 'QTDEFGQC'
      FieldName = 'QTDEFGQC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object pplfValorAtualizadoppField36: TppField
      FieldAlias = 'VLR_IOFCOMP'
      FieldName = 'VLR_IOFCOMP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
  end
  object dtsValorAtualizado: TwwDataSource
    DataSet = qryValorAtualizado
    Left = 112
    Top = 67
  end
  object rptRelValorAtualizado: TppReport
    AutoStop = False
    DataPipeline = pplValorAtualizado
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Movimentação por Contrato'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Funcef programas\RelValorAtu.rtm'
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Language = lgPortugueseBrazil
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 160
    Top = 12
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplValorAtualizado'
    object phdrbnd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 67204
      mmPrintPosition = 0
      object pmg1: TppImage
        UserName = 'Image2'
        AutoSize = True
        MaintainAspectRatio = True
        Picture.Data = {
          0A544A504547496D61676592150000FFD8FFE000104A46494600010101009000
          900000FFDB004300020101020101020202020202020203050303030303060404
          0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
          0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080063006803012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FDFC
          A28CD26EFA5002D1499A33400BDAA9EBBAE43E1ED22E2F6E996382DA3323B1EC
          055ADDCF4AC7F1EF84D3C71E10D474B76DAB7D0B45B80E99AC6BCAA2A527495E
          5676F5E86D878D37562AB3B46EAFE97D4F92F5EFF82AE1B1F1ACD05AF87526D0
          E197635C34844C4038242F7AFAC7E1D78FACFE25784ACB58D3DB75BDE461C7FB
          248E457E776BFF00F04FFF0088D6BE359B4EB5D3166B19273B2F3CC017613D71
          ED5F7C7C02F867FF000A87E1869BA2B49E6496F182EDDB711CD7E69C0B98F10E
          23195A19B45F22DAEADADF65E47EB5E23655C2D85C0D09E4934EA3DD277D2DBB
          ECEE76D452668CD7EA27E3E2D1499A33400B4519A2803CBFF6C6FDA0E4FD977F
          667F1878F21D3E3D52E3C3760D7315ABB94599C90AB9232700B67039206323AD
          7E64C1FF000722F8C25851FF00E107D241619FBF271FA57EB778D3C13A5FC42F
          0CDDE8FABDA437DA6DF27973C120CAC8BD706BCCD3F609F84F1A8FF8A3748F94
          63FD42FF00857E95C11C41C2B80C2D4867D81788A8E578B52B251B6DBF7D4F9D
          CE30399D7A91782ADC8ADAE9D4FCE0FF008890FC61FF00424E91FF007D49FE14
          7FC4487E30FF00A12748FF00BEA4FF000AFBCFC7FF00B3E7C01F863711C5AC68
          5E1FB5964E9198D370F7C63A56E785FF00637F82FE32D2A3BDD37C31A15E5B49
          D1E389187F2AFAC87885E18CEABA10CA9B92E9CFAFDD738EA70CF1453A31AF3A
          ED41ED2E5767F3B1F9E03FE0E43F1863FE449D27FEFB93FC2BD23F671FF83883
          4AF1878DACF4BF1D7877FB1EDEFA410ADD5A12C90B1E017DDDABED91FB05FC27
          CFFC89BA4FAE3C85FF000AFCDCFF0082FBFECADE0BF81DA1F84FC41E19D260D2
          EF2FAE3ECD32C4BB559546471EBEF5F4FC3788F0F789F30864787CB6546756EA
          33E6D9DAFDFC8F1F308679975178CA95D4A31B5D5B747EBAE91E22B3D7343875
          4B5B88A4B1B8884E93291B4A119CE6BF3EBF6C5FF82F7787FE0A78FAF7C33E0D
          D1FF00E120BED2E431DD5C487F71BC1C1552BD48AEDFF63FF1D6A5A8FF00C118
          3FB626BA95F5087C3378EB3163B81457C73ED8AF857FE084DF00FC35FB4CFC7D
          F12DE78C2C57556D2E05BA8D64E55A47277161DFF1AF0383781725C2C335CD33
          D8CAB52C0CB914169CCEED5DFF0091D99B6758BAAF0D87C1B5195657BF63D1BF
          E2244F187FD091A4E3FDE93FC28FF8890FC61FF424E93FF7D49FE15FA3E7F60C
          F84F93FF00146E8FFF007E17FC2AB6ADFB12FC1ED0B4F92EAF3C2BA1DADBC232
          F249122AAFE38A25C71E1B45734B27925E73D3F32A392F104A4A2B15ABE96D4F
          CE9FF88913C61FF424E93FF7D49FE14D3FF072278C00FF00912748FF00BEE4FF
          000AFBB7C19F03FF0067BF1EEB5269FA668BE1D9AE90E027969F39F41C735D9F
          FC3067C29CE7FE10DD27FEFCA8C7E959E1FC40F0C6BC79E8652E4BBA9DFE5B9D
          18AE1BE26C34F931388E5976716B4F9A23FF00827FFED3D79FB62FEC99E14F88
          B7DA7C1A5DD78845D6FB6877148FC9BB9ADC633CF22207F1A2BD33E1F7C3ED27
          E17784ED743D06C60D3B4AB1DFE45BC4A0247BDD9DB03DD998FE3457E239955A
          1531756A6163CB4E526E31DED16F45F25A1F53878548528C6ABBC92577DD9B5D
          29AC77210BDC562FC45F889A4FC2AF05DF6BFAF5E4763A569A9E6DC4EE70B1AF
          1C9FCEBCB7C2BFF0511F83BE30D4A3B4B5F1C68CB34D8D9E6CCA8189E80735AE
          0F25C7E2E94AB6168CE715A3718B697AD90AAE32852928D4924FA5DA47C4FF00
          B69596B50FC7FD60EB2B74D213980904AF97FC2076AFA3BFE095D69ACC1E0CD5
          A4B85B85D2CCF8884A08F9BBEDCF6AFA43C4DF0E3C35F146082EAFAC6C7528D8
          078E52A1B70EA0E6A1F14F8DFC21F003C28B36ADA8697E1DD2E3E15A6758949F
          41EA6BF26C8FC3AC4E1F88258F85473BB768A4DB6DF4F91FB171078A187C770D
          C327F60A2E2A29CAEACADD57A9D706C9AFCC2FF839539F851E06FF00B08B7FE8
          35F67F86FF00E0A1BF08FC59E25B5D274FF1769F737F79208A18D1C1DEC4E001
          CFAD7C5FFF0007291FF8B51E05FF00B08B7E5B6BFAAFC21CAB1982E36C043174
          A54DB93B7326AFEEBD753F9E78A7114AB65359D2927A7477EA7A57EC67FF0028
          399BFEC57D407E8F5F30FF00C1B55FF258FC6FFF0060F8BF99AFA7BF633FF941
          C4DFF62C6A1FC9EBE61FF836A8FF00C5E4F1B7FD83E2FE66BF44A7FF0024E714
          FF00D7FF00FDB99F3F2FF7FCBBFC27EC938E315F3C7FC1486D358B9F80920D33
          CE685655372B167715FC2BA6F88FFB76FC2FF851E2FB8D0F5EF145969FA9DAB0
          12C4EE032D757F0E7E32F827F682D1A56F0FEB5A47886DB6FEFA3864593603D9
          876AFE58E20E13CC31395548D5A73853A91B29F2BB6BB3B9FAD70EF1161F0199
          D2C547966E9C93E5BAD6DD0FCC5F81D65ABDC7C5AD097458EE86A1F685D8CAA4
          63A6735FACDA52489A65B2CBFEB7CA5DF9F5C73583E1AF83DE19F05EA125F69F
          A4D9DADC3FCCD22A0047BFB570BE3BFDBDBE12FC3AD55AC752F1A68CB7919224
          8927563191D9B9E0D7C97877E1FE3F2FA752851E6AD293BDA29B497C8FB1F12B
          C41C2E7B5E9555054A304D6AD5DB7FE47B163145739F0AFE29687F1AFC0D63E2
          4F0EDF45A968FA8EFF00B3DC4672B26C91A36C7D19187E1457D7D4A53A7374EA
          AB493B34F74D7467E7D19DD73476672DFB5EFECFEBFB51FECEBE28F019BD5D3C
          7892D3ECDF6865DC23F983671F857E4EFED77FF0428D43F65EF82D79E31D37C5
          56FA9FF6285792110B23ED19E41F6AFDADDB5F3C7FC152BE5FD8A3C6783CFD8D
          B9FC0D7EA1E18F1D67194661432EC0D5E5A556A479E2D269DDA4F7F23E6F88B2
          5C2E2A84ABD58DE518BB3BEC7CF7FF000405FDA7B5EF8BFF0005355F0BEB9797
          1A8BF869F305C4EFBDFCB6E8B9EB815F1EFF00C14ABE26F8B3F6D4FF00828D49
          F0B535096D6C6D7535D1AC20DE7C8DC403E632838279EB5EE9FF0006D7FCB6DE
          3BFF00722C7E75F3EEADFF0029DBB7E98FF84C93FF0041AFDEB29CB70981E3DC
          EB1387A7152A34653868ACA4D26DA5E6CF8AC5622AD6C97094E727694ACFCD76
          3EA7FD9FFF00E0DF86F841F12BC3BE28B8F195B5D5C68F3C575242B6EC379521
          B683F8555FF8393C6CF84FE055F4D41FFF0041AFD3F5E9EB5F987FF072973F0A
          7C0BCFFCC45F3C7FB35F97F877C659B71171DE5F5F36ABCF28C9A5A2564D3EC7
          D167D94E1B0193568E16364D2BFDE7A47EC67FF28389BFEC58D43F93D7CC3FF0
          6D57FC963F1B7FD83E2FE66BE9EFD8C8E7FE086F37FD8AFA87F27AF987FE0DAA
          FF0092C7E36FFB07C5FCCD7D653FF926F8A7FEBFFF00EDCCF2E5FEFF0096FF00
          84FA23F6C9FF00821D27ED59F1DB58F1A7FC25D069ADAA10C216859B691F4AF8
          43E1C9F17FFC12C3FE0A19A7784EDF586BA55BE82D6ED21256DEEA199F00B2E7
          92057EFC30E38AFC2CFF0082A9F3FF00057FB5EDFE9BA673FF0003AE7F06F8C3
          33CF2588E1ECD24AA61A3879B51715A72A56D6D735E2ACAF0F83F678EC3AE5A8
          E6AED3EE7E8AFF00C1653F697D63E017EC7D35C6833C9677FE2293EC29711B6D
          68414C920FD2BF3B3F60AFF8240EABFB75FC39B8F1C6A5E298F4E86EA5C2F9B1
          B492DC37396241AFB13FE0E07DBFF0C69E17E3FE6229DBFE995765FF000417F9
          BF621D3C31FF0096E7BFD6B9F87F39C4F0E7870F35CA1A857A95DC5CAC9BB27B
          6A5637090CC33E587C5EB08C2E97A9EFFF00B0B7ECC8BFB1DFECBDE18F872B7E
          BA9AF87BED43ED214A897CEBA9A7E87D3CDC7E1457AEF9786CD15FCDD8CC555C
          5E2278AACEF39B7293EEDBBB7F79FA0D1A31A54D5386CB441D57B579B7ED5BF0
          21BF694F81DADF83E3D43FB2DF5684C42E766FF2F3DF1567F6A2F8FD61FB2EFC
          09F1278F354B4BABFB1F0EDB7DA6582DFF00D64A3705C2FBF35F1169DFF0717F
          83358B459AD7E1E78D6E23201263B7DCBCF3D457D670A709F10E3ED99E4B45CD
          5292F795ACA4B55BB47999966781A2FEAF8B9A5CCB6D7547B37FC131FF00E099
          971FF04F74F102CDE2AFF8497FB6C228FF0047F2BCADA7F5AF3CBBFF00822CDC
          5CFEDF51FC69FF0084EB10A6B4BAB7F65FD9319C0C6CDD5A1E26FF0082E57847
          C2DF04FC29E34BCF06F8A21B6F156A52E9B0DB3C41658990E0B303D8D7D2DE33
          FDA8B4BF057ECA97BF1566B0BC974BB2D2CEACD68A079E53FBBF5AFA9C6665C6
          F82C6CF31C45E353197A2E568FBEFE1715D3CAE797470F93D6A31C3D3B38D2F7
          92D74F33D4F90BFC3F857CB3FF000538FF0082734DFF000509F08E81A643E273
          E196D16E4CE5C5BF9BE6E46315CC68BFF0599F08EB3FB1C6A7F1893C33AEAE93
          A5DD25ABD99502672C40C8F6AF5EFD8EBF6EFF0007FED9FF000B27F127875A58
          24B307ED5613E3ED101033C8F7AF9FC1E4BC4FC395BFB668D29537427CAE564F
          9676D9EFD1FA1DF5B1B9763E1F559CD35257B77467FC16FD89E4F849FB083FC1
          A6D7BED92369371A6FF69793B70650C376DF6DDD2BCAFF00E0989FF049AB8FF8
          27AF8D75CD5A6F197FC24BFDB36E9008FECDE5795B73CFEB5D67EC6FFF00054B
          F0BFED89F12FC45E1BD2F43D5B4997C36D289EE2EC011158C90483E9C579D7ED
          0FFF0005E1F873F07BC7F75E1BD0F47D6BC5F7966E629A7D3A1F3615619CAE47
          A57D061F03C735AA63324A54A5CD88B54AB1B46CEFAA937B2BF4D4E29D6C9E0A
          962E525687BB17AF4F23EECCFF003AF82BF6B1FF008230DD7ED2DFB65C3F1563
          F1CFF65C71CF6B3FF67FD977E7C920E377BD769FB2DFFC1657E1FF00ED3161AE
          470E9BAD68BAC68568D76F657909569D4039DBF977AF293FF0711782E4D4AF2D
          6DBE1FF8CEF1AC6568A430DBF99B4838CF1EB83D6A38638638DF29C6D7795509
          42AC63CB3F87E1979B76B3EE8ACC332C9F13461F599A71BDD6FBA3E8AFF82887
          EC2537EDCFF04F4BF0945E21FF00847DF4DB813FDA7C8F33CCC26DC63F5ADAFF
          00827FFEC7927EC4FF00032DFC1F2EB9FDBCD0396FB4F95E5E7F0AF2BF865FF0
          585F0EFC44F815E32F1D7FC21BE27D36CFC1D079F3C17306C96E074F941AF2AD
          3BFE0E2DF05EAF02CD6BF0F3C6D708C3EF476FBC7E9574786F8E31595CF22A74
          5CA8539DE51F72CA6D5F7BF5BDF72658EC9E962563252F7E51B27AEA91FA3A0E
          28AF36FD923F690B4FDAD3F67DD03C7F63A5DFE8D6BAF7DA3CBB3BD4D93C5E55
          C4B01DC3B64C448F6228AFCA71185A987AD3C3D556945B4D7669D9A3E9E9548D
          482A90D99E6DFF00057419FF0082767C50FF00B059E7FEDA2D7E627FC13ABF6B
          2F889F053E0A4BA6F857E0BDBFC40B1675637CD6CB26D38E99C57EBE7ED97F00
          67FDA8BF668F16780ADAFE3D367F125A7D992E645DCB11DC0E481CF6AE17FE09
          C5FB10DE7EC35F06E4F0BDF6B56BAEC924A24134511451818C60815FB2707F1A
          65595F076272FC5D355AACEB464A9B728DD28A4DDD767D0F90CDB27C56273585
          7A4F962A2D39249EB7DACCFCFCFF0082C578BB56F885FB397C13F116B9E158FC
          1B7B3EAF2B5CE9D1C2156DC0C1C903A57D75F1D3C6FA3CBFF046FD5265D46D36
          5E7855A084F98332391F747AB57B97EDA1FB1A7867F6D3F84371E17F1046636F
          BF6B749C3DBBFA83FCEBE0DB7FF82057C48BB8E1D0750F8C535CF82219729A50
          57DAA99E838EB8AF7725E25E1DCD32AC150C7E23EAB3C257954E5E59494A2E5C
          CA317DD6DA9C78BCB71D86C4D59D087B45520A37DACF6D51F3EF82E196D7FE08
          5DE2A9DE3658DB5780AB11F29F986715C77C01D63E24FF00C13EED7C3FF16B45
          8A6BDF07F89216B5BD894EE8E62CBF75BB2E339CD7EA77C71FF825B693E2BFD8
          1FFE148F83B518F42B559639BED73A799B9C1CB13F535D4FC19FF827CE93E1AF
          D8C47C23F174D07882CDA131B4EB1EDDAC4603AFA118AFA55E3064D1C1E25548
          AA90C46264E74E49DDD2692E65D9E975A9E73E15C5BAB0E5BC5C209292DB9974
          3F2C7FE09D5E27D52E748F8DDABE8BE643757DA45E5C3F9672D1A3AB1383EA3D
          6BE86FF8378BC0DE03F11781BC43A86A706977FE349A5C4F1DE2AC926CC9C305
          6FC7915EF7FF0004FEFF00824B49FB18FC43F12DFDEEBD69AF68FAE4325B0B26
          879113640563DF8AF3AF8C9FF0425D4EC7E265F7887E0E7C42BCF87FFDA52192
          788339DB939C2E070A3D2AB88B8F387738A98FCAE9629D085754DC2AF2BB7B8A
          CE124B5B0F039263F0B1A3889D3E7716EF1BAEAF747D37F137E19FC30F0EF857
          E22EA1E17B1F0DC7E289B4A945F7D93CB334600FEEAFDDFD2BF277FE09C777F1
          8ADBC5BF11BFE15268BA0EB3FE9D9D4FFB4A247F28EE3B76EE06BEFF00FD93BF
          E0907AA7C0F4F136ADE25F881AA788BC55E22B16B292E04AC206CF7643D6BC83
          C2DFF0426F8A1F0E759D56EBC2BF1964F0D8D5A6696E058AB45E6F2480D81CE0
          5797C2BC41C3D96E131F9655C7C6B7B4F67CB2AB09B8BE5DD596AD2FB3D8DF33
          CBF1D88A946BC6838F2F369169357FC0EC7E343FC49BBFF8251FC509BE29E93A
          3693E22DAEB1AE9D1468AD0718CED03BD7C9FF00F04F2FDAD7E237C12F818BA6
          F85FE0B5BF8FAC415617ED6AAE738E99C57DA9E07FF8258FC4AB7F819E3EF087
          8BBE2CDD78A8F8BAC45A5AC9785E45B36CE776315EDDFF0004E8FD8B6F3F621F
          820BE11BED62DF5C91640FE7C519418031DC571FFAEB9165D92E3306FD9E2655
          2B46718454E10B72A4DAEAACFA36691C9F1B88C652ADAD34A2D36ECDDEFB76D4
          F44FD973C5FA8F8F3E03787758D5BC3F1F85751BE81A5B8D2923F2C5A3798E31
          81D338DDF8D15E8014003D076F4A2BF9DF17888D5AF3AB15CAA4DB4B7B5DED7F
          23EF69D39460A17D90F0A051B05145626C1B051B4628A2800D82976D1450026C
          14BB714514008541A360A28A004F2D7D3B62942003A514500285C51451401FFF
          D9}
        mmHeight = 26194
        mmLeft = 529
        mmTop = 265
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label15'
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 28310
        mmTop = 5027
        mmWidth = 85725
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label16'
        Caption = 'DIBEN - Diretoria de Benefícios '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 28310
        mmTop = 10319
        mmWidth = 50334
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'GERAT - Gerência de Relacionamento e Atendimento '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 28310
        mmTop = 14817
        mmWidth = 84879
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'COPART - Coordenação de Operações com Participantes '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 28310
        mmTop = 19579
        mmWidth = 91567
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label6'
        Caption = 'Central de Atendimento: 0800 706 9000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 150019
        mmTop = 17463
        mmWidth = 43127
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label7'
        Caption = 'CEP: 70.712-900, Brasília - DF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 150019
        mmTop = 14288
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label8'
        Caption = 'Ed. Corporate Financial Center'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 150019
        mmTop = 11113
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label9'
        Caption = 'SCN. qd. 2 bl. A,12º e 13º andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 150019
        mmTop = 7938
        mmWidth = 37571
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label1001'
        Caption = 'www.funcef.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 150019
        mmTop = 4763
        mmWidth = 20638
        BandType = 0
      end
      object rpp1: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 29898
        mmLeft = 0
        mmTop = 35983
        mmWidth = 197909
        BandType = 0
      end
      object ppLabel95: TppLabel
        UserName = 'Label95'
        AutoSize = False
        Caption = 'Demonstrativo de Valores em Aberto - Empréstimo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 20638
        mmTop = 29104
        mmWidth = 154517
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label14'
        Caption = 'Dados do Mutuário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 2117
        mmTop = 36777
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label3'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 43127
        mmWidth = 8731
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 0
        mmTop = 41275
        mmWidth = 196321
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 43127
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 117740
        mmTop = 43127
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label63'
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 138113
        mmTop = 43127
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label64'
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 173302
        mmTop = 43127
        mmWidth = 8731
        BandType = 0
      end
      object rptRelValorAtualizado_lblPlano: TppLabel
        UserName = 'rptRelValorAtualizado_lblPlano'
        Caption = 'NOVO PLANO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 173302
        mmTop = 47890
        mmWidth = 20902
        BandType = 0
      end
      object rptRelValorAtualizado_lblPatrocinadora: TppLabel
        UserName = 'rptRelValorAtualizado_lblPatrocinadora'
        AutoSize = False
        Caption = 'CAIXA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 138113
        mmTop = 47890
        mmWidth = 28575
        BandType = 0
      end
      object rptRelValorAtualizado_lblMatricula: TppLabel
        UserName = 'rptRelValorAtualizado_lblMatricula'
        Caption = '0391970'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 118269
        mmTop = 47890
        mmWidth = 12435
        BandType = 0
      end
      object rptRelValorAtualizado_lblCPF: TppLabel
        UserName = 'rptRelValorAtualizado_lblCPF'
        Caption = '31571735100'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 47625
        mmWidth = 19579
        BandType = 0
      end
      object rptRelValorAtualizado_lblMutuario: TppLabel
        UserName = 'rptRelValorAtualizado_lblMutuario'
        AutoSize = False
        Caption = 'AUGUSTO DOS SANTOS ABBADIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 1852
        mmTop = 47890
        mmWidth = 90488
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label2'
        Caption = 'Situação do Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 93134
        mmTop = 54504
        mmWidth = 37211
        BandType = 0
      end
      object rptRelValorAtualizado_lblSitPart: TppLabel
        UserName = 'rptRelValorAtualizado_lblSitPart'
        Caption = 'APOSENTEDO POR TEMPO DE CONTRIBUIÇÃO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 93134
        mmTop = 59267
        mmWidth = 72178
        BandType = 0
      end
    end
    object pdtlbnd1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape1'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 1852
        mmTop = 0
        mmWidth = 196057
        BandType = 4
      end
      object pdbtxtRelValorAtualizado_Itens: TppDBText
        UserName = 'DBText5'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplValorAtualizado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 19315
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object pdbtxt1: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'HMEDATAPREVISTA'
        DataPipeline = pplValorAtualizado
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 56356
        mmTop = 794
        mmWidth = 17727
        BandType = 4
      end
      object pdbtxt2: TppDBText
        UserName = 'DBText11'
        DataField = 'PARCELAS'
        DataPipeline = pplValorAtualizado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 41804
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object pdbtxt3: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        DataField = 'VLR_JUROSREMUNERA'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 142082
        mmTop = 794
        mmWidth = 13758
        BandType = 4
      end
      object pdbtxt4: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'VLR_ENCARGOS'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 169069
        mmTop = 794
        mmWidth = 14552
        BandType = 4
      end
      object pdbtxt5: TppDBText
        UserName = 'DBText9'
        DataField = 'VLR_ATUALIZADO'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 184680
        mmTop = 794
        mmWidth = 12171
        BandType = 4
      end
      object pdbtxt6: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'VLR_JUROSMORA'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 794
        mmWidth = 13758
        BandType = 4
      end
      object pdbtxt7: TppDBText
        UserName = 'DBText1'
        BlankWhenZero = True
        DataField = 'VLR_MULTA'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 108479
        mmTop = 794
        mmWidth = 13229
        BandType = 4
      end
      object pdbtxt8: TppDBText
        UserName = 'DBText2'
        BlankWhenZero = True
        DataField = 'VLR_CORRECAO'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 91811
        mmTop = 794
        mmWidth = 16140
        BandType = 4
      end
      object pdbtxt9: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 75671
        mmTop = 794
        mmWidth = 14817
        BandType = 4
      end
      object pdbtxt10: TppDBText
        UserName = 'DBText4'
        DataField = 'ANOMES'
        DataPipeline = pplValorAtualizado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 794
        mmWidth = 13229
        BandType = 4
      end
      object pdbtxtVLR_IOFCOMP: TppDBText
        UserName = 'DBText12'
        BlankWhenZero = True
        DataField = 'VLR_IOFCOMP'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 157163
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
    end
    object pftrbnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 30427
      mmPrintPosition = 0
      object psystmvrbl1: TppSystemVariable
        UserName = 'SystemVariable3'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 67998
        mmTop = 1852
        mmWidth = 62971
        BandType = 8
      end
      object psystmvrbl2: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 167482
        mmTop = 1852
        mmWidth = 28840
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'Label1'
        Caption = 
          '(2) Parcela: Número da parcela atual / Quantidade de parcelas re' +
          'stantes.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 1852
        mmTop = 9260
        mmWidth = 79375
        BandType = 8
      end
      object ppLabel69: TppLabel
        UserName = 'Label33'
        Caption = 
          '(3) INPC/IBGE - Índice Nacional de Preços ao Consumidor, informa' +
          'do pelo Instituto Brasileiro de Geografia e Estatística.  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 1852
        mmTop = 12435
        mmWidth = 132038
        BandType = 8
      end
      object ppLabel71: TppLabel
        UserName = 'Label34'
        Caption = '(4) Multa: 2%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 1852
        mmTop = 15610
        mmWidth = 14478
        BandType = 8
      end
      object ppLabel73: TppLabel
        UserName = 'Label36'
        Caption = '(5) Juros de Mora: 0,033 % (ao dia).'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 1852
        mmTop = 18785
        mmWidth = 39116
        BandType = 8
      end
      object ppLabel75: TppLabel
        UserName = 'Label37'
        Caption = '(6) Juros Remuneratórios: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 21960
        mmWidth = 29633
        BandType = 8
      end
      object ppLabel77: TppLabel
        UserName = 'Label38'
        Caption = 
          'Nota: FGQC (Fundo Garantidor para Quitação de Crédito) - Somente' +
          ' para as modalidades: Novo Credinâmico, Credinâmico e Crédito ao' +
          ' Participante para Integralização de Reserva Previdenciária.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5757
        mmLeft = 1852
        mmTop = 24606
        mmWidth = 187833
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 265
        mmWidth = 198438
        BandType = 8
      end
      object ppLabel41: TppLabel
        UserName = 'Label20'
        Caption = '(1) Prazo:Em meses.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 1852
        mmTop = 6085
        mmWidth = 22987
        BandType = 8
      end
      object pdbtxt11: TppDBText
        UserName = 'DBText301'
        DataField = 'TAXA'
        DataPipeline = pplValorAtualizado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 30956
        mmTop = 21960
        mmWidth = 22225
        BandType = 8
      end
    end
    object pgrp1: TppGroup
      BreakName = 'IDCONTRATOEMPTMO'
      DataPipeline = pplValorAtualizado
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'pgrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValorAtualizado'
      object pgrphdrbnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 40746
        mmPrintPosition = 0
        object rpp3: TppShape
          UserName = 'Shape3'
          Pen.Width = 2
          mmHeight = 22225
          mmLeft = 0
          mmTop = 794
          mmWidth = 197644
          BandType = 3
          GroupNo = 0
        end
        object rpp4: TppShape
          UserName = 'rpp4'
          Pen.Width = 2
          mmHeight = 15081
          mmLeft = 0
          mmTop = 25665
          mmWidth = 197644
          BandType = 3
          GroupNo = 0
        end
        object ppLabel101: TppLabel
          UserName = 'Label13'
          Caption = 'Dados do Contrato de Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 2910
          mmTop = 2117
          mmWidth = 64294
          BandType = 3
          GroupNo = 0
        end
        object ppLine27: TppLine
          UserName = 'Line27'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 3969
          mmLeft = 265
          mmTop = 6350
          mmWidth = 196586
          BandType = 3
          GroupNo = 0
        end
        object ppLabel102: TppLabel
          UserName = 'Label102'
          Caption = 'Nº Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 8202
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel103: TppLabel
          UserName = 'Label103'
          Caption = 'Modalidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 31750
          mmTop = 8202
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel107: TppLabel
          UserName = 'Label107'
          Caption = 'Taxa de Juros Contratual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 99484
          mmTop = 8202
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppLabel108: TppLabel
          UserName = 'Label108'
          Caption = 'Índice de Correção do Saldo Devedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7673
          mmLeft = 125677
          mmTop = 8202
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object ppLabel111: TppLabel
          UserName = 'Label111'
          Caption = 'Prazo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 157957
          mmTop = 8202
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppLabel112: TppLabel
          UserName = 'Label112'
          Caption = 'Data de Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 172509
          mmTop = 8202
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object pdbtxt12: TppDBText
          UserName = 'pdbtxt12'
          DataField = 'DATACREDITO'
          DataPipeline = pplValorAtualizado
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 3175
          mmLeft = 173567
          mmTop = 17198
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object pdbtxt13: TppDBText
          UserName = 'pdbtxt13'
          DataField = 'PRAZO'
          DataPipeline = pplValorAtualizado
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 3175
          mmLeft = 157427
          mmTop = 17198
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object pdbtxt14: TppDBText
          UserName = 'pdbtxt14'
          DataField = 'INDICE'
          DataPipeline = pplValorAtualizado
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 3175
          mmLeft = 130440
          mmTop = 17198
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object pdbtxt15: TppDBText
          UserName = 'pdbtxt15'
          DataField = 'TAXA'
          DataPipeline = pplValorAtualizado
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 3175
          mmLeft = 101071
          mmTop = 17198
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object pdbtxt16: TppDBText
          UserName = 'pdbtxt16'
          DataField = 'TSEDESCRICAO'
          DataPipeline = pplValorAtualizado
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          ReprintOnSubsequent = True
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 3175
          mmLeft = 25400
          mmTop = 17198
          mmWidth = 73290
          BandType = 3
          GroupNo = 0
        end
        object pdbtxt17: TppDBText
          UserName = 'pdbtxt17'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplValorAtualizado
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 17198
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object ppLabel114: TppLabel
          UserName = 'Label114'
          Caption = 'Itens em Aberto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 2646
          mmTop = 26723
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object ppLine28: TppLine
          UserName = 'Line28'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 3969
          mmLeft = 529
          mmTop = 31221
          mmWidth = 196586
          BandType = 3
          GroupNo = 0
        end
        object ppLabel116: TppLabel
          UserName = 'Label116'
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 3440
          mmLeft = 20638
          mmTop = 34660
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object ppLabel115: TppLabel
          UserName = 'Label115'
          Caption = 'Mês / Ano Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 2381
          mmTop = 32808
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppLabel117: TppLabel
          UserName = 'Label117'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 3440
          mmLeft = 41275
          mmTop = 34660
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppLabel118: TppLabel
          UserName = 'Label118'
          Caption = '(2)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 2879
          mmLeft = 51065
          mmTop = 32544
          mmWidth = 2963
          BandType = 3
          GroupNo = 0
        end
        object ppLabel119: TppLabel
          UserName = 'Label119'
          Caption = 'Data de Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 56092
          mmTop = 32808
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel120: TppLabel
          UserName = 'Label120'
          Caption = 'Valor Nominal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 76465
          mmTop = 32808
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel121: TppLabel
          UserName = 'Label121'
          Caption = 'Correção Monetária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 92075
          mmTop = 32808
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel122: TppLabel
          UserName = 'Label122'
          Caption = '(3)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 2879
          mmLeft = 106892
          mmTop = 32544
          mmWidth = 2963
          BandType = 3
          GroupNo = 0
        end
        object ppLabel123: TppLabel
          UserName = 'Label123'
          Caption = 'Multa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 3440
          mmLeft = 112184
          mmTop = 34660
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel124: TppLabel
          UserName = 'Label124'
          Caption = '(4)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 2879
          mmLeft = 120386
          mmTop = 34131
          mmWidth = 2963
          BandType = 3
          GroupNo = 0
        end
        object ppLabel125: TppLabel
          UserName = 'Label125'
          Caption = 'Juros de Mora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 124619
          mmTop = 32808
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel126: TppLabel
          UserName = 'Label126'
          Caption = '(5)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 2879
          mmLeft = 138113
          mmTop = 32544
          mmWidth = 2963
          BandType = 3
          GroupNo = 0
        end
        object ppLabel127: TppLabel
          UserName = 'Label127'
          Caption = 'Juros Remun.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 142346
          mmTop = 32808
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppLabel128: TppLabel
          UserName = 'Label128'
          Caption = '(6)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 2879
          mmLeft = 153459
          mmTop = 32544
          mmWidth = 2963
          BandType = 3
          GroupNo = 0
        end
        object ppLabel129: TppLabel
          UserName = 'Label129'
          Caption = 'Total Encargos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 169334
          mmTop = 32808
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel130: TppLabel
          UserName = 'Label130'
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 186796
          mmTop = 32808
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rptRelValorAtualizado_lblDataVencto2: TppLabel
          UserName = 'rptRelValorAtualizado_lblDataVencto2'
          Caption = '03/12/2013'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3810
          mmLeft = 179123
          mmTop = 26988
          mmWidth = 16002
          BandType = 3
          GroupNo = 0
        end
        object ppLabel131: TppLabel
          UserName = 'Label131'
          Caption = 'Valores atualizados para:   '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 137848
          mmTop = 26988
          mmWidth = 41540
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label18'
          Caption = '(1)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 2910
          mmLeft = 167217
          mmTop = 8202
          mmWidth = 2910
          BandType = 3
          GroupNo = 0
        end
        object ppLabel36: TppLabel
          UserName = 'Label10'
          Caption = 'IOF Compl.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 157427
          mmTop = 32808
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
      end
      object pgrpftrbnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 53446
        mmPrintPosition = 0
        object ppLabel22: TppLabel
          UserName = 'Label17'
          Caption = 'Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 3175
          mmTop = 1058
          mmWidth = 6879
          BandType = 5
          GroupNo = 0
        end
        object ppLine11: TppLine
          UserName = 'Line11'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object pdbclc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplValorAtualizado
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = pgrp1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 2910
          mmLeft = 78846
          mmTop = 1323
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 75936
          mmTop = 529
          mmWidth = 13494
          BandType = 5
          GroupNo = 0
        end
        object pdbclc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLR_CORRECAO'
          DataPipeline = pplValorAtualizado
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = pgrp1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 2910
          mmLeft = 93927
          mmTop = 1323
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 92075
          mmTop = 529
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
        object pdbclc3: TppDBCalc
          UserName = 'pdbclc3'
          DataField = 'VLR_MULTA'
          DataPipeline = pplValorAtualizado
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = pgrp1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 2910
          mmLeft = 111919
          mmTop = 1323
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 110067
          mmTop = 529
          mmWidth = 12171
          BandType = 5
          GroupNo = 0
        end
        object pdbclc4: TppDBCalc
          UserName = 'pdbclc4'
          DataField = 'VLR_JUROSMORA'
          DataPipeline = pplValorAtualizado
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = pgrp1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 2910
          mmLeft = 127529
          mmTop = 1323
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 125413
          mmTop = 529
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
        object pdbclc5: TppDBCalc
          UserName = 'pdbclc5'
          DataField = 'VLR_JUROSREMUNERA'
          DataPipeline = pplValorAtualizado
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = pgrp1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 2910
          mmLeft = 144198
          mmTop = 1323
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 142082
          mmTop = 529
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object pdbclc6: TppDBCalc
          UserName = 'pdbclc6'
          DataField = 'VLR_ENCARGOS'
          DataPipeline = pplValorAtualizado
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = pgrp1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 2910
          mmLeft = 170127
          mmTop = 1323
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 169334
          mmTop = 529
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object pdbclc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VLR_ATUALIZADO'
          DataPipeline = pplValorAtualizado
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = pgrp1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 2910
          mmLeft = 184680
          mmTop = 1323
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 183886
          mmTop = 529
          mmWidth = 13494
          BandType = 5
          GroupNo = 0
        end
        object ppLine23: TppLine
          UserName = 'Line23'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 93134
          mmTop = 8996
          mmWidth = 99219
          BandType = 5
          GroupNo = 0
        end
        object ppLabel78: TppLabel
          UserName = 'Label78'
          Caption = 'Resumo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4763
          mmLeft = 138642
          mmTop = 9790
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object ppLine24: TppLine
          UserName = 'Line24'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 93134
          mmTop = 14288
          mmWidth = 99219
          BandType = 5
          GroupNo = 0
        end
        object ppLabel80: TppLabel
          UserName = 'Label80'
          Caption = 'Quantidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 150019
          mmTop = 15875
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel81: TppLabel
          UserName = 'Label81'
          Caption = 'Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 179917
          mmTop = 15610
          mmWidth = 6879
          BandType = 5
          GroupNo = 0
        end
        object ppLine25: TppLine
          UserName = 'Line25'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 93134
          mmTop = 30956
          mmWidth = 99219
          BandType = 5
          GroupNo = 0
        end
        object ppLine26: TppLine
          UserName = 'Line26'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 160867
          mmTop = 44715
          mmWidth = 31485
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 93134
          mmTop = 51594
          mmWidth = 99219
          BandType = 5
          GroupNo = 0
        end
        object ppLabel85: TppLabel
          UserName = 'Label85'
          Caption = 'Saldo Devedor Total:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 128323
          mmTop = 46567
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object ppLabel84: TppLabel
          UserName = 'Label84'
          Caption = 'Saldo Devedor a Vencer:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 122502
          mmTop = 39158
          mmWidth = 35983
          BandType = 5
          GroupNo = 0
        end
        object ppLabel83: TppLabel
          UserName = 'Label83'
          Caption = 'Saldo Devedor Vencido:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 123296
          mmTop = 33338
          mmWidth = 35190
          BandType = 5
          GroupNo = 0
        end
        object ppLabel79: TppLabel
          UserName = 'Label79'
          Caption = 'Prestações (Valor Nominal + Encargos)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 93663
          mmTop = 20638
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object ppLabel82: TppLabel
          UserName = 'Label82'
          Caption = 'FGQC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 93663
          mmTop = 25400
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object pdbtxt18: TppDBText
          UserName = 'pdbtxt18'
          DataField = 'QTDEPRESTACOES'
          DataPipeline = pplValorAtualizado
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 3704
          mmLeft = 155311
          mmTop = 20638
          mmWidth = 7144
          BandType = 5
          GroupNo = 0
        end
        object pdbtxt19: TppDBText
          UserName = 'pdbtxt19'
          DataField = 'QTDEFGQC'
          DataPipeline = pplValorAtualizado
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 3704
          mmLeft = 155311
          mmTop = 25400
          mmWidth = 7144
          BandType = 5
          GroupNo = 0
        end
        object pdbtxt20: TppDBText
          UserName = 'pdbtxt20'
          DataField = 'VLRATUALIZADO'
          DataPipeline = pplValorAtualizado
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 3969
          mmLeft = 175948
          mmTop = 20638
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object pdbtxt21: TppDBText
          UserName = 'pdbtxt21'
          DataField = 'VLRFGQC'
          DataPipeline = pplValorAtualizado
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 3969
          mmLeft = 175948
          mmTop = 25400
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object pdbtxt22: TppDBText
          UserName = 'pdbtxt22'
          DataField = 'VLRDEVVENCIDO'
          DataPipeline = pplValorAtualizado
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 3969
          mmLeft = 175948
          mmTop = 33338
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object pdbtxt23: TppDBText
          UserName = 'pdbtxt23'
          DataField = 'VLRDEVVENCER'
          DataPipeline = pplValorAtualizado
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 3969
          mmLeft = 175948
          mmTop = 39158
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object pdbtxt24: TppDBText
          UserName = 'pdbtxt24'
          DataField = 'TOTALDEVIDO'
          DataPipeline = pplValorAtualizado
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 3969
          mmLeft = 175948
          mmTop = 46567
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppLabel42: TppLabel
          UserName = 'Label802'
          Caption = 'Itens em aberto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 93927
          mmTop = 15875
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line12'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 157427
          mmTop = 529
          mmWidth = 10319
          BandType = 5
          GroupNo = 0
        end
        object pdbclcVLR_IOFCOMP: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLR_IOFCOMP'
          DataPipeline = pplValorAtualizado
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = pgrp1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValorAtualizado'
          mmHeight = 2910
          mmLeft = 157427
          mmTop = 1323
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object prmtrlst1: TppParameterList
    end
  end
  object qryValorAtualizado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39' AS ITEDE' +
        'SCRICAO,'
      '   '#39'Atualização Débito'#39' AS EVENTO,'
      '   '#39'0000/00'#39' AS ANOMES,'
      ''
      '   HME.IDCONTRATOEMPTMO, HME.HMETIPOMOV, HME.IDITEMEMPTMO,'
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,'
      ''
      '   HME.HMEDATAPREVISTA,'
      '   HME.HMEVLRPREVISTO,'
      ''
      '   0.00 AS VLR_CORRECAO,'
      '   0.00 AS VLR_MULTA,'
      '   0.00 AS VLR_JUROSMORA,'
      '   0.00 AS VLR_JUROSREMUNERA,'
      ''
      '   0.00 AS VLR_ENCARGOS,'
      '   0.00 AS VLR_ATUALIZADO,'
      ''
      '/*William Santana SOL 218798.16629 PPM 560594 */'
      '   0.00 AS VLR_IOFCOMP,'
      '/*William Santana SOL 218798.16629 PPM 560594 */'
      ''
      '   HME.HMEPARCELA, HME.HMENUMPARCELAS,       '
      ''
      '   HME.HMEPARCELAALT, '
      '   HME.HMESEQCOBRANCA, HME.HMESALDODEV, HME.HMETXJUROS,'
      ''
      '   -- TADEU PASSOS SOL 1791770 KTN 1736570'
      '   '#39'08 / 13'#39' PARCELAS,  '
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39' AS TSEDE' +
        'SCRICAO,'
      '   '#39'00000 % (ao ano)'#39' AS TAXA,'
      '   '#39'0000'#39' AS PRAZO,'
      '   '#39'00/00/0000'#39' AS DATACREDITO,'
      '   '#39' 0123456789'#39' AS INDICE,'
      '   0 AS VLRATUALIZADO,'
      '   0 AS VLRFGQC,'
      '   0 AS TOTALDEVIDO,'
      '   0 AS VLRDEVVENCIDO,'
      '   0 AS VLRDEVVENCER,'
      '   0 AS QTDEPRESTACOES,'
      '   0 AS QTDEFGQC'
      '   -- TADEU PASSOS SOL 1791770 KTN 1736570'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '   1 = 2')
    UpdateObject = updValorAtualizado
    ValidateWithMask = True
    Left = 112
    Top = 80
    object qryValorAtualizadoITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qryValorAtualizadoEVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 18
    end
    object qryValorAtualizadoANOMES: TStringField
      FieldName = 'ANOMES'
      FixedChar = True
      Size = 7
    end
    object qryValorAtualizadoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryValorAtualizadoHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryValorAtualizadoIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryValorAtualizadoHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryValorAtualizadoHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryValorAtualizadoHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryValorAtualizadoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryValorAtualizadoHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
    object qryValorAtualizadoHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryValorAtualizadoHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryValorAtualizadoHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryValorAtualizadoHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryValorAtualizadoVLR_ENCARGOS: TFloatField
      FieldName = 'VLR_ENCARGOS'
    end
    object qryValorAtualizadoVLR_ATUALIZADO: TFloatField
      FieldName = 'VLR_ATUALIZADO'
    end
    object qryValorAtualizadoVLR_CORRECAO: TFloatField
      FieldName = 'VLR_CORRECAO'
    end
    object qryValorAtualizadoVLR_MULTA: TFloatField
      FieldName = 'VLR_MULTA'
    end
    object qryValorAtualizadoVLR_JUROSMORA: TFloatField
      FieldName = 'VLR_JUROSMORA'
    end
    object qryValorAtualizadoVLR_JUROSREMUNERA: TFloatField
      FieldName = 'VLR_JUROSREMUNERA'
    end
    object qryValorAtualizadoPARCELAS: TStringField
      FieldName = 'PARCELAS'
      Size = 83
    end
    object qryValorAtualizadoHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryValorAtualizadoTSEDESCRICAO: TStringField
      FieldName = 'TSEDESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qryValorAtualizadoTAXA: TStringField
      FieldName = 'TAXA'
      FixedChar = True
      Size = 16
    end
    object qryValorAtualizadoPRAZO: TStringField
      FieldName = 'PRAZO'
      FixedChar = True
      Size = 4
    end
    object qryValorAtualizadoDATACREDITO: TStringField
      FieldName = 'DATACREDITO'
      FixedChar = True
      Size = 10
    end
    object qryValorAtualizadoINDICE: TStringField
      FieldName = 'INDICE'
      FixedChar = True
      Size = 11
    end
    object qryValorAtualizadoVLRFGQC: TFloatField
      FieldName = 'VLRFGQC'
    end
    object qryValorAtualizadoTOTALDEVIDO: TFloatField
      FieldName = 'TOTALDEVIDO'
    end
    object qryValorAtualizadoVLRATUALIZADO: TFloatField
      FieldName = 'VLRATUALIZADO'
    end
    object qryValorAtualizadoVLRDEVVENCIDO: TFloatField
      FieldName = 'VLRDEVVENCIDO'
    end
    object qryValorAtualizadoVLRDEVVENCER: TFloatField
      FieldName = 'VLRDEVVENCER'
    end
    object qryValorAtualizadoQTDEPRESTACOES: TFloatField
      FieldName = 'QTDEPRESTACOES'
    end
    object qryValorAtualizadoQTDEFGQC: TFloatField
      FieldName = 'QTDEFGQC'
    end
    object qryValorAtualizadoVLR_IOFCOMP: TFloatField
      FieldName = 'VLR_IOFCOMP'
    end
  end
  object updValorAtualizado: TUpdateSQL
    Left = 216
    Top = 56
  end
  object rptOld: TppReport
    AutoStop = False
    DataPipeline = pplValorAtualizado
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Movimentação por Contrato'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Fabio\CM\Relatorios\mov.ep 1.rtm'
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 80
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplValorAtualizado'
    object ppTitleBand2: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 95250
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape9'
        Pen.Width = 2
        mmHeight = 15081
        mmLeft = 0
        mmTop = 77788
        mmWidth = 197644
        BandType = 1
      end
      object ppShape5: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 22225
        mmLeft = 0
        mmTop = 52917
        mmWidth = 197644
        BandType = 1
      end
      object ppImage3: TppImage
        UserName = 'Image2'
        AutoSize = True
        MaintainAspectRatio = True
        Picture.Data = {
          0A544A504547496D6167650E240000FFD8FFE000104A46494600010101006000
          600000FFE110B24578696600004D4D002A000000080004013B00020000001500
          00084A8769000400000001000008609C9D00010000002A00001080EA1C000700
          00080C0000003E000000001CEA00000008000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000546164657520506172
          6569726120506173736F7300000001EA1C00070000080C00000872000000001C
          EA00000008000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000054006100640065007500200050006100720065
          00690072006100200050006100730073006F0073000000FFE10A6D687474703A
          2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F787061636B65
          7420626567696E3D27EFBBBF272069643D2757354D304D7043656869487A7265
          537A4E54637A6B633964273F3E0D0A3C783A786D706D65746120786D6C6E733A
          783D2261646F62653A6E733A6D6574612F223E3C7264663A52444620786D6C6E
          733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F3032
          2F32322D7264662D73796E7461782D6E7323223E3C7264663A44657363726970
          74696F6E207264663A61626F75743D22757569643A66616635626464352D6261
          33642D313164612D616433312D6433336437353138326631622220786D6C6E73
          3A64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E7473
          2F312E312F222F3E3C7264663A4465736372697074696F6E207264663A61626F
          75743D22757569643A66616635626464352D626133642D313164612D61643331
          2D6433336437353138326631622220786D6C6E733A64633D22687474703A2F2F
          7075726C2E6F72672F64632F656C656D656E74732F312E312F223E3C64633A63
          726561746F723E3C7264663A53657120786D6C6E733A7264663D22687474703A
          2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E74
          61782D6E7323223E3C7264663A6C693E54616465752050617265697261205061
          73736F733C2F7264663A6C693E3C2F7264663A5365713E0D0A0909093C2F6463
          3A63726561746F723E3C2F7264663A4465736372697074696F6E3E3C2F726466
          3A5244463E3C2F783A786D706D6574613E0D0A20202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020200A2020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020200A202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          200A202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020200A20202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020200A2020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020200A202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020200A20202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020200A2020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020202020200A
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020200A202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020200A20202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020200A2020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020200A202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020200A20202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020202020200A2020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20200A2020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020200A202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020200A20202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020200A2020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020200A202020202020202020
          202020202020202020202020202020202020203C3F787061636B657420656E64
          3D2777273F3EFFDB00430007050506050407060506080707080A110B0A09090A
          150F100C1118151A19181518171B1E27211B1D251D1718222E222528292B2C2B
          1A202F332F2A32272A2B2AFFDB0043010708080A090A140B0B142A1C181C2A2A
          2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
          2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2AFFC00011080051004D03012200021101
          031101FFC4001F00000105010101010101000000000000000001020304050607
          08090A0BFFC400B5100002010303020403050504040000017D01020300041105
          122131410613516107227114328191A1082342B1C11552D1F02433627282090A
          161718191A25262728292A3435363738393A434445464748494A535455565758
          595A636465666768696A737475767778797A838485868788898A929394959697
          98999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3
          D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01
          00030101010101010101010000000000000102030405060708090A0BFFC400B5
          1100020102040403040705040400010277000102031104052131061241510761
          711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A
          262728292A35363738393A434445464748494A535455565758595A6364656667
          68696A737475767778797A82838485868788898A92939495969798999AA2A3A4
          A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9
          DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F
          00FA468A28A00293B52D21FBA680380F1A7C5BD1BC1FAA0D3A4866BDBA0332A4
          2C07979E9927BD6D782FC6FA678DB4B6BAD3898E58CE25B773F3467B7E1EF5F3
          9FC52D1350D1FC79A83DF2BB47752B4D0CA738653CE01F6E95DE7ECFBA26A11D
          DEA1AC49E64765243E4C608C091B703B87D31FAD6CE1151B8AFA9EED4503A515
          88C28A28A004638526BCA6EBE3FE83697935BC9A66A05A27284A84C120E3D6BD
          5986548AE725F017856595A49740B167725998C43249EF4D38ADD01C3FFC343F
          87FF00E817A8FE49FE349FF0D0FE1FFF00A056A3F927F8D7683C0DE0C32F9434
          3D3BCC1FC3E58CD6278E3C03E178BC0FAACF6FA2DAC12C36ED2A49126D60C064
          7354A54E5B03BA357C35E2AF0E7C42B2325BC314EF07DFB7BA45678FDF073C7B
          8ACCF137C55F0D782AF0694B0B4F247F7A1B3550B1679C1E40CFB5783FC3AD5E
          EF47F1ADACB62E15A559236CF208D84FF31547C3F6EBE20F1B5943A89322DE5D
          AF9C470583373FCEB5F6693F215CF6CFF8687F0FFF00D02F51FC93FC68FF0086
          87F0F7FD02F51FC93FC6BB61F0F7C2289CF87EC30A3A9885321F02F836727CAD
          0F4D931D76C60E2B1E6A77B587A993E10F8B5A578CB5AFECCB0B1BB825F2CBEE
          9B6E303E86BBF0722B1B4DF0A685A35DFDA74AD26D6D26C6DF3228C038FAD6C8
          E949DAFA08427033551F54B10706EA1041C1F9C55A6195AC4B9F0C68F2248C6C
          220CD925B6F39F5AE7AB2A895E16F99A4395BB48C5B7F0CDCDBF8B0EB525FC5F
          64DE64DDBF9208FBA7B639F5ABBE38D4ACA5F01EB2915D42CC6CE40007193C57
          0915C4D368B676D24CE616BE6429B8E36E178FD6BAFF0019787348B6F02EAF2C
          36312C8966E5580E41C75AF2B2FABCCDFB28D95EEEEFABEC766261CB6E77F71F
          36783BFE46FB1FAC9FFA2DAA5F033AC7E3CD219C80AB768493D866A2F077FC8D
          F63F593FF45B549E088927F1C69514AA1D1EE91594F42335F512BD9D8F38FACE
          E6FACEE2D65863BC80BC88540F307535CE7853C3F71E19BD9AEB53BC85639536
          2AABF04E41C9CE39E3F5A9BC4FE1ED2ADBC3779716B66914B147B95D3820E6B9
          8D30B6AFAF69106A4ED3C4D6F928C4E0F5AF94C4D671C443DA47DE5B6AEDAF73
          D2A50BD27CAF4EBDCF4E86FED677DB0DC47237A2B835601C8CD66DA689A6E9F3
          79D67671C52631B94735A2BF7457B74F99AF7F7F238656BFBA2E2A3980F29BFD
          D3525324F9A3603AE0D54FE1625B9E336BFF001E363FF6116FE4B5E8FE3AFF00
          927DAD7FD793FF002AE42DFC29AC476B6A8D69868EF4CAC378E170BCFE95DBF8
          B2CA7D4BC1DAA5959A799713DABC71A6719623815E36534E7072E656D8EEC64E
          32E5B3B9F28783BFE46FB1FAC9FF00A2DAA7F01FFC8FDA3FFD7DA7F3AEA7C33F
          0AFC6161E23B4BABAD24C71465F7379AA7194603BFA9A93C25F0BBC5DA778C34
          CBDBCD28C704172AF239954ED00E73D6BE99C958F3AC7BCF8BFF00E452D47FEB
          8FF5AE17C33FF233E8DFF5EDFF00C557A0F88ED26BEF0EDEDB5AA6F9658F6A2E
          71935C9E87E1BD52CF5ED32E2E2DB645043B246DC383CFF8D7CAE3A94E58BA72
          8AD34FCCF4F0F38C68C937DFF23BE3C74A78E94C34F1D2BDF3CD118FCA715E2F
          6BF15FC59AAEAF7F67A4E93A5B8B490A1334E50900E0752335ECEFF74E2BC5FC
          15F0B3ED3E23D667F19E8AC60794B5AB34A467E63CFCADFCEAE1649DC1A3A2D2
          FE20EB173E3F9FC39A8D85AC260B213BB2162C1F60623D31935CC4DF1B7598BC
          3B77A82E9B65E6417C2D9572F8DA558E7AF5F96B43C4BE1AF12E91F12EEFC47E
          1FD2C6A715E5A98422C813CA3B02F39EBD2B98B9F85FE254F8791C4B60D2EA57
          5A88B99ADD5D7F7681580CF38EF5694019D7DAFC5C9EFEF7C331595ADBB47AAB
          6CBADC4E6171D40FE7CD559FE2BF89AFEEF577F0CE8305D58696D8959D98B9E7
          07007D0D67DF7C31D4F4FF008A9A66A1A45833E926549E60AC02C2D8C30C67F1
          E3D69F67E1EF1BF81EF35FB6F0F6922F97536DF0DE248A3C9EBFC2DD48CD3B43
          A0AE5CD6FE30EAB15CE8B0E8BA65B97D4EDC3B25D9642926E2A573C71C75352E
          B3F133C57E1FF0AAEA7A9695A68964BC5B78D6398BA9051989C83D781F9D6178
          B7C09E2EBDD5741B9D42C4F889ADADB177B5D62563BC9D9904763D452F887C25
          AEEAFE058B49D2BC18DA4F91A8ACFE42DD097CC051833649E31C0FC695A3A01D
          E782FC51E2AD77520358D3B4E82CCC5BFCCB69F7B027A6464E2BBD1D2B9AF08F
          83346F0C5BACDA6E9E2D2EA7855673E63364819C7248EBE95D2D65269BD0A034
          9DE8A2A180514514FA0303451453109DE94514524002968A28433FFFD9}
        mmHeight = 21431
        mmLeft = 265
        mmTop = 0
        mmWidth = 20373
        BandType = 1
      end
      object ppLabel13: TppLabel
        UserName = 'Label204'
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 24077
        mmTop = 1852
        mmWidth = 85725
        BandType = 1
      end
      object ppLabel14: TppLabel
        UserName = 'Label23'
        Caption = 'Diretoria de Benefícios - DIBEN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24342
        mmTop = 7144
        mmWidth = 49477
        BandType = 1
      end
      object ppLabel15: TppLabel
        UserName = 'Label24'
        Caption = 'Gerência de Atendimento - GERAT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24342
        mmTop = 11642
        mmWidth = 54769
        BandType = 1
      end
      object ppLabel16: TppLabel
        UserName = 'Label94'
        Caption = 'Coordenação de Empréstimos e Financiamentos - COEMF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24342
        mmTop = 16404
        mmWidth = 92075
        BandType = 1
      end
      object ppLabel17: TppLabel
        UserName = 'Label95'
        AutoSize = False
        Caption = 'Demonstrativo de Valores em Aberto - Empréstimo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 20902
        mmTop = 23283
        mmWidth = 154517
        BandType = 1
      end
      object ppLabel20: TppLabel
        UserName = 'Label96'
        Caption = 'Central de Atendimento: 0800 706 9000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 149754
        mmTop = 15346
        mmWidth = 43127
        BandType = 1
      end
      object ppLabel23: TppLabel
        UserName = 'Label97'
        Caption = 'CEP: 70.712-900, Brasília - DF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 149754
        mmTop = 12171
        mmWidth = 33602
        BandType = 1
      end
      object ppLabel24: TppLabel
        UserName = 'Label98'
        Caption = 'Ed. Corporate Financial Center'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 149754
        mmTop = 8996
        mmWidth = 33602
        BandType = 1
      end
      object ppLabel25: TppLabel
        UserName = 'Label902'
        Caption = 'SCN. qd. 2 bl. A,12º e 13º andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 149754
        mmTop = 5821
        mmWidth = 37571
        BandType = 1
      end
      object ppLabel26: TppLabel
        UserName = 'Label100'
        Caption = 'www.funcef.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 149754
        mmTop = 2646
        mmWidth = 20638
        BandType = 1
      end
      object ppShape6: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        mmHeight = 17992
        mmLeft = 265
        mmTop = 31750
        mmWidth = 197380
        BandType = 1
      end
      object ppLabel27: TppLabel
        UserName = 'Label1'
        Caption = 'Dados do Mutuário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 2646
        mmTop = 32808
        mmWidth = 35190
        BandType = 1
      end
      object ppLine12: TppLine
        UserName = 'Line21'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 529
        mmTop = 37306
        mmWidth = 196321
        BandType = 1
      end
      object ppLabel28: TppLabel
        UserName = 'Label18'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 39158
        mmWidth = 8731
        BandType = 1
      end
      object ppLabel29: TppLabel
        UserName = 'Label3'
        Caption = 'rptRelValorAtualizado_lblMutuario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 43921
        mmWidth = 48683
        BandType = 1
      end
      object ppLabel30: TppLabel
        UserName = 'Label6'
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 54769
        mmTop = 39158
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel31: TppLabel
        UserName = 'rptRelValorAtualizado_lblCPF'
        Caption = 'rptRelValorAtualizado_lblCPF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 54769
        mmTop = 43921
        mmWidth = 29369
        BandType = 1
      end
      object ppLabel32: TppLabel
        UserName = 'rptRelValorAtualizado_lblMatricula1'
        Caption = 'rptRelValorAtualizado_lblMatricula'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 87313
        mmTop = 43921
        mmWidth = 19315
        BandType = 1
      end
      object ppLabel33: TppLabel
        UserName = 'Label21'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 86784
        mmTop = 39158
        mmWidth = 14023
        BandType = 1
      end
      object ppLabel38: TppLabel
        UserName = 'rptRelValorAtualizado_lblPatrocinadora'
        AutoSize = False
        Caption = 'rptRelValorAtualizado_lblPatrocinadora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 110596
        mmTop = 43921
        mmWidth = 53975
        BandType = 1
      end
      object ppLabel39: TppLabel
        UserName = 'Label63'
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 110596
        mmTop = 39158
        mmWidth = 21431
        BandType = 1
      end
      object ppLabel40: TppLabel
        UserName = 'Label64'
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 168805
        mmTop = 39158
        mmWidth = 8731
        BandType = 1
      end
      object ppLabel49: TppLabel
        UserName = 'rptRelValorAtualizado_lblPlano'
        Caption = 'rptRelValorAtualizado_lblPlano'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 168805
        mmTop = 43921
        mmWidth = 26723
        BandType = 1
      end
      object ppLabel50: TppLabel
        UserName = 'Label101'
        Caption = 'Dados do Contrato de Empréstimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 2910
        mmTop = 54240
        mmWidth = 64294
        BandType = 1
      end
      object ppLine13: TppLine
        UserName = 'Line27'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 265
        mmTop = 58473
        mmWidth = 196586
        BandType = 1
      end
      object ppLabel51: TppLabel
        UserName = 'Label102'
        Caption = 'Nº Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 60325
        mmWidth = 17463
        BandType = 1
      end
      object ppLabel52: TppLabel
        UserName = 'Label103'
        Caption = 'Modalidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 60325
        mmWidth = 17463
        BandType = 1
      end
      object ppLabel53: TppLabel
        UserName = 'rptRelValorAtualizado_lblContrato2'
        Caption = 'rptRelValorAtualizado_lblContrato2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 3175
        mmTop = 69321
        mmWidth = 19844
        BandType = 1
      end
      object ppLabel54: TppLabel
        UserName = 'rptRelValorAtualizado_lblTipoContr2'
        AutoSize = False
        Caption = 'rptRelValorAtualizado_lblTipoContr'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 69321
        mmWidth = 48683
        BandType = 1
      end
      object ppLabel55: TppLabel
        UserName = 'rptRelValorAtualizado_lblTaxa2'
        AutoSize = False
        Caption = 'rptRelValorAtualizado_lblTaxa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 83344
        mmTop = 69321
        mmWidth = 20902
        BandType = 1
      end
      object ppLabel56: TppLabel
        UserName = 'Label701'
        Caption = 'Taxa de Juros Contratual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 82550
        mmTop = 60325
        mmWidth = 22754
        BandType = 1
      end
      object ppLabel57: TppLabel
        UserName = 'Label108'
        Caption = 'Índice de Correção do Saldo Devedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 113242
        mmTop = 60325
        mmWidth = 29633
        BandType = 1
      end
      object ppLabel58: TppLabel
        UserName = 'rptRelValorAtualizado_lblIndice2'
        Caption = 'rptRelValorAtualizado_lblIndice'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 118004
        mmTop = 69321
        mmWidth = 18521
        BandType = 1
      end
      object ppLabel59: TppLabel
        UserName = 'rptRelValorAtualizado_lblPrazo2'
        Caption = 'rptRelValorAtualizado_lblPrazo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 150548
        mmTop = 69321
        mmWidth = 6615
        BandType = 1
      end
      object ppLabel60: TppLabel
        UserName = 'Label111'
        Caption = 'Prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 149490
        mmTop = 60325
        mmWidth = 8731
        BandType = 1
      end
      object ppLabel61: TppLabel
        UserName = 'Label112'
        Caption = 'Data de Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 60325
        mmWidth = 23548
        BandType = 1
      end
      object ppLabel62: TppLabel
        UserName = 'rptRelValorAtualizado_lblDataCredito2'
        Caption = 'rptRelValorAtualizado_lblDataCredito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 69321
        mmWidth = 20108
        BandType = 1
      end
      object ppLabel104: TppLabel
        UserName = 'Label114'
        Caption = 'Itens em Aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 2646
        mmTop = 78846
        mmWidth = 29104
        BandType = 1
      end
      object ppLine14: TppLine
        UserName = 'Line28'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 529
        mmTop = 83344
        mmWidth = 196586
        BandType = 1
      end
      object ppLabel105: TppLabel
        UserName = 'Label115'
        Caption = 'Mês / Ano Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 2381
        mmTop = 84931
        mmWidth = 15346
        BandType = 1
      end
      object ppLabel106: TppLabel
        UserName = 'Label116'
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 20638
        mmTop = 86784
        mmWidth = 5821
        BandType = 1
      end
      object ppLabel109: TppLabel
        UserName = 'Label117'
        Caption = 'Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 51594
        mmTop = 86784
        mmWidth = 10054
        BandType = 1
      end
      object ppLabel110: TppLabel
        UserName = 'Label104'
        Caption = '(1)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 61383
        mmTop = 84667
        mmWidth = 2910
        BandType = 1
      end
      object ppLabel113: TppLabel
        UserName = 'Label119'
        Caption = 'Data de Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 66146
        mmTop = 84931
        mmWidth = 17463
        BandType = 1
      end
      object ppLabel132: TppLabel
        UserName = 'Label120'
        Caption = 'Valor Nominal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 87048
        mmTop = 84931
        mmWidth = 12171
        BandType = 1
      end
      object ppLabel133: TppLabel
        UserName = 'Label121'
        Caption = 'Correção Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 102659
        mmTop = 84931
        mmWidth = 14552
        BandType = 1
      end
      object ppLabel134: TppLabel
        UserName = 'Label122'
        Caption = '(2)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 117475
        mmTop = 84667
        mmWidth = 2910
        BandType = 1
      end
      object ppLabel135: TppLabel
        UserName = 'Label123'
        Caption = 'Multa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 121973
        mmTop = 86784
        mmWidth = 8202
        BandType = 1
      end
      object ppLabel136: TppLabel
        UserName = 'Label124'
        Caption = '(3)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 130175
        mmTop = 86254
        mmWidth = 2910
        BandType = 1
      end
      object ppLabel137: TppLabel
        UserName = 'Label125'
        Caption = 'Juros de Mora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 135467
        mmTop = 84931
        mmWidth = 13229
        BandType = 1
      end
      object ppLabel138: TppLabel
        UserName = 'Label126'
        Caption = '(4)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 148961
        mmTop = 84667
        mmWidth = 2910
        BandType = 1
      end
      object ppLabel139: TppLabel
        UserName = 'Label127'
        Caption = 'Juros Remun.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 153459
        mmTop = 84931
        mmWidth = 10848
        BandType = 1
      end
      object ppLabel140: TppLabel
        UserName = 'Label128'
        Caption = '(5)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 164571
        mmTop = 84667
        mmWidth = 2910
        BandType = 1
      end
      object ppLabel141: TppLabel
        UserName = 'Label129'
        Caption = 'Total Encargos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 168011
        mmTop = 84931
        mmWidth = 13494
        BandType = 1
      end
      object ppLabel142: TppLabel
        UserName = 'Label130'
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 186796
        mmTop = 84931
        mmWidth = 7673
        BandType = 1
      end
      object ppLabel143: TppLabel
        UserName = 'Label131'
        Caption = 'Valores atualizados para:   '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 137848
        mmTop = 79111
        mmWidth = 41540
        BandType = 1
      end
      object ppLabel144: TppLabel
        UserName = 'rptRelValorAtualizado_lblDataVencto2'
        Caption = '00/00/0000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 179123
        mmTop = 79111
        mmWidth = 16002
        BandType = 1
      end
      object ppLabel35: TppLabel
        UserName = 'rptRelValorAtualizado_lblSitPart'
        Caption = 'rptRelValorAtualizado_lblSitPart'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4022
        mmLeft = 39952
        mmTop = 32544
        mmWidth = 49445
        BandType = 1
      end
    end
    object ppHeaderBand2: TppHeaderBand
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 70644
      mmPrintPosition = 0
      object ppShape10: TppShape
        UserName = 'Shape1'
        Pen.Width = 2
        mmHeight = 22225
        mmLeft = 0
        mmTop = 30956
        mmWidth = 197644
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape7'
        Pen.Width = 2
        mmHeight = 15081
        mmLeft = 0
        mmTop = 55563
        mmWidth = 197644
        BandType = 0
      end
      object ppLabel145: TppLabel
        UserName = 'Label35'
        Caption = 'Valores atualizados para:   '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 137848
        mmTop = 56886
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel146: TppLabel
        UserName = 'Label19'
        Caption = '00/00/0000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 179123
        mmTop = 56886
        mmWidth = 16140
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line22'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 529
        mmTop = 61119
        mmWidth = 196586
        BandType = 0
      end
      object ppLabel147: TppLabel
        UserName = 'Label67'
        Caption = 'Itens em Aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 2646
        mmTop = 56621
        mmWidth = 29104
        BandType = 0
      end
      object ppLabel148: TppLabel
        UserName = 'Label2'
        Caption = 'Mês / Ano Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 2381
        mmTop = 62706
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel149: TppLabel
        UserName = 'Label4'
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 20638
        mmTop = 64558
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel150: TppLabel
        UserName = 'Label5'
        Caption = 'Data de Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 66146
        mmTop = 62706
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel151: TppLabel
        UserName = 'Label7'
        Caption = 'Valor Nominal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 87048
        mmTop = 62706
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel152: TppLabel
        UserName = 'Label8'
        Caption = 'Correção Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 102659
        mmTop = 62706
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel153: TppLabel
        UserName = 'Label9'
        Caption = 'Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 51594
        mmTop = 64558
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel154: TppLabel
        UserName = 'Label10'
        Caption = '(1)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 61383
        mmTop = 62442
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel155: TppLabel
        UserName = 'Label41'
        Caption = '(2)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 117475
        mmTop = 62442
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel156: TppLabel
        UserName = 'Label42'
        Caption = 'Multa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 121973
        mmTop = 64558
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel157: TppLabel
        UserName = 'Label12'
        Caption = '(3)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 130175
        mmTop = 64029
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel158: TppLabel
        UserName = 'Label22'
        Caption = 'Juros de Mora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 135467
        mmTop = 62706
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel159: TppLabel
        UserName = 'Label44'
        Caption = '(4)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 148961
        mmTop = 62442
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel160: TppLabel
        UserName = 'Label13'
        Caption = 'Juros Remun.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 153459
        mmTop = 62706
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel161: TppLabel
        UserName = 'Label14'
        Caption = '(5)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 164571
        mmTop = 62442
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel162: TppLabel
        UserName = 'Label15'
        Caption = 'Total Encargos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 168011
        mmTop = 62706
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel163: TppLabel
        UserName = 'Label16'
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 186796
        mmTop = 62706
        mmWidth = 7673
        BandType = 0
      end
      object ppImage4: TppImage
        UserName = 'Image1'
        AutoSize = True
        MaintainAspectRatio = True
        Picture.Data = {
          0A544A504547496D6167650E240000FFD8FFE000104A46494600010101006000
          600000FFE110B24578696600004D4D002A000000080004013B00020000001500
          00084A8769000400000001000008609C9D00010000002A00001080EA1C000700
          00080C0000003E000000001CEA00000008000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000546164657520506172
          6569726120506173736F7300000001EA1C00070000080C00000872000000001C
          EA00000008000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000054006100640065007500200050006100720065
          00690072006100200050006100730073006F0073000000FFE10A6D687474703A
          2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F787061636B65
          7420626567696E3D27EFBBBF272069643D2757354D304D7043656869487A7265
          537A4E54637A6B633964273F3E0D0A3C783A786D706D65746120786D6C6E733A
          783D2261646F62653A6E733A6D6574612F223E3C7264663A52444620786D6C6E
          733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F3032
          2F32322D7264662D73796E7461782D6E7323223E3C7264663A44657363726970
          74696F6E207264663A61626F75743D22757569643A66616635626464352D6261
          33642D313164612D616433312D6433336437353138326631622220786D6C6E73
          3A64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E7473
          2F312E312F222F3E3C7264663A4465736372697074696F6E207264663A61626F
          75743D22757569643A66616635626464352D626133642D313164612D61643331
          2D6433336437353138326631622220786D6C6E733A64633D22687474703A2F2F
          7075726C2E6F72672F64632F656C656D656E74732F312E312F223E3C64633A63
          726561746F723E3C7264663A53657120786D6C6E733A7264663D22687474703A
          2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E74
          61782D6E7323223E3C7264663A6C693E54616465752050617265697261205061
          73736F733C2F7264663A6C693E3C2F7264663A5365713E0D0A0909093C2F6463
          3A63726561746F723E3C2F7264663A4465736372697074696F6E3E3C2F726466
          3A5244463E3C2F783A786D706D6574613E0D0A20202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020200A2020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020200A202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          200A202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020200A20202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020200A2020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020200A202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020200A20202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020200A2020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020202020200A
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020200A202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020200A20202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020200A2020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020200A202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020200A20202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020202020200A2020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20200A2020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020200A202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020200A20202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020200A2020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020200A202020202020202020
          202020202020202020202020202020202020203C3F787061636B657420656E64
          3D2777273F3EFFDB00430007050506050407060506080707080A110B0A09090A
          150F100C1118151A19181518171B1E27211B1D251D1718222E222528292B2C2B
          1A202F332F2A32272A2B2AFFDB0043010708080A090A140B0B142A1C181C2A2A
          2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
          2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2AFFC00011080051004D03012200021101
          031101FFC4001F00000105010101010101000000000000000001020304050607
          08090A0BFFC400B5100002010303020403050504040000017D01020300041105
          122131410613516107227114328191A1082342B1C11552D1F02433627282090A
          161718191A25262728292A3435363738393A434445464748494A535455565758
          595A636465666768696A737475767778797A838485868788898A929394959697
          98999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3
          D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01
          00030101010101010101010000000000000102030405060708090A0BFFC400B5
          1100020102040403040705040400010277000102031104052131061241510761
          711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A
          262728292A35363738393A434445464748494A535455565758595A6364656667
          68696A737475767778797A82838485868788898A92939495969798999AA2A3A4
          A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9
          DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F
          00FA468A28A00293B52D21FBA680380F1A7C5BD1BC1FAA0D3A4866BDBA0332A4
          2C07979E9927BD6D782FC6FA678DB4B6BAD3898E58CE25B773F3467B7E1EF5F3
          9FC52D1350D1FC79A83DF2BB47752B4D0CA738653CE01F6E95DE7ECFBA26A11D
          DEA1AC49E64765243E4C608C091B703B87D31FAD6CE1151B8AFA9EED4503A515
          88C28A28A004638526BCA6EBE3FE83697935BC9A66A05A27284A84C120E3D6BD
          5986548AE725F017856595A49740B167725998C43249EF4D38ADD01C3FFC343F
          87FF00E817A8FE49FE349FF0D0FE1FFF00A056A3F927F8D7683C0DE0C32F9434
          3D3BCC1FC3E58CD6278E3C03E178BC0FAACF6FA2DAC12C36ED2A49126D60C064
          7354A54E5B03BA357C35E2AF0E7C42B2325BC314EF07DFB7BA45678FDF073C7B
          8ACCF137C55F0D782AF0694B0B4F247F7A1B3550B1679C1E40CFB5783FC3AD5E
          EF47F1ADACB62E15A559236CF208D84FF31547C3F6EBE20F1B5943A89322DE5D
          AF9C470583373FCEB5F6693F215CF6CFF8687F0FFF00D02F51FC93FC68FF0086
          87F0F7FD02F51FC93FC6BB61F0F7C2289CF87EC30A3A9885321F02F836727CAD
          0F4D931D76C60E2B1E6A77B587A993E10F8B5A578CB5AFECCB0B1BB825F2CBEE
          9B6E303E86BBF0722B1B4DF0A685A35DFDA74AD26D6D26C6DF3228C038FAD6C8
          E949DAFA08427033551F54B10706EA1041C1F9C55A6195AC4B9F0C68F2248C6C
          220CD925B6F39F5AE7AB2A895E16F99A4395BB48C5B7F0CDCDBF8B0EB525FC5F
          64DE64DDBF9208FBA7B639F5ABBE38D4ACA5F01EB2915D42CC6CE40007193C57
          0915C4D368B676D24CE616BE6429B8E36E178FD6BAFF0019787348B6F02EAF2C
          36312C8966E5580E41C75AF2B2FABCCDFB28D95EEEEFABEC766261CB6E77F71F
          36783BFE46FB1FAC9FFA2DAA5F033AC7E3CD219C80AB768493D866A2F077FC8D
          F63F593FF45B549E088927F1C69514AA1D1EE91594F42335F512BD9D8F38FACE
          E6FACEE2D65863BC80BC88540F307535CE7853C3F71E19BD9AEB53BC85639536
          2AABF04E41C9CE39E3F5A9BC4FE1ED2ADBC3779716B66914B147B95D3820E6B9
          8D30B6AFAF69106A4ED3C4D6F928C4E0F5AF94C4D671C443DA47DE5B6AEDAF73
          D2A50BD27CAF4EBDCF4E86FED677DB0DC47237A2B835601C8CD66DA689A6E9F3
          79D67671C52631B94735A2BF7457B74F99AF7F7F238656BFBA2E2A3980F29BFD
          D3525324F9A3603AE0D54FE1625B9E336BFF001E363FF6116FE4B5E8FE3AFF00
          927DAD7FD793FF002AE42DFC29AC476B6A8D69868EF4CAC378E170BCFE95DBF8
          B2CA7D4BC1DAA5959A799713DABC71A6719623815E36534E7072E656D8EEC64E
          32E5B3B9F28783BFE46FB1FAC9FF00A2DAA7F01FFC8FDA3FFD7DA7F3AEA7C33F
          0AFC6161E23B4BABAD24C71465F7379AA7194603BFA9A93C25F0BBC5DA778C34
          CBDBCD28C704172AF239954ED00E73D6BE99C958F3AC7BCF8BFF00E452D47FEB
          8FF5AE17C33FF233E8DFF5EDFF00C557A0F88ED26BEF0EDEDB5AA6F9658F6A2E
          71935C9E87E1BD52CF5ED32E2E2DB645043B246DC383CFF8D7CAE3A94E58BA72
          8AD34FCCF4F0F38C68C937DFF23BE3C74A78E94C34F1D2BDF3CD118FCA715E2F
          6BF15FC59AAEAF7F67A4E93A5B8B490A1334E50900E0752335ECEFF74E2BC5FC
          15F0B3ED3E23D667F19E8AC60794B5AB34A467E63CFCADFCEAE1649DC1A3A2D2
          FE20EB173E3F9FC39A8D85AC260B213BB2162C1F60623D31935CC4DF1B7598BC
          3B77A82E9B65E6417C2D9572F8DA558E7AF5F96B43C4BE1AF12E91F12EEFC47E
          1FD2C6A715E5A98422C813CA3B02F39EBD2B98B9F85FE254F8791C4B60D2EA57
          5A88B99ADD5D7F7681580CF38EF5694019D7DAFC5C9EFEF7C331595ADBB47AAB
          6CBADC4E6171D40FE7CD559FE2BF89AFEEF577F0CE8305D58696D8959D98B9E7
          07007D0D67DF7C31D4F4FF008A9A66A1A45833E926549E60AC02C2D8C30C67F1
          E3D69F67E1EF1BF81EF35FB6F0F6922F97536DF0DE248A3C9EBFC2DD48CD3B43
          A0AE5CD6FE30EAB15CE8B0E8BA65B97D4EDC3B25D9642926E2A573C71C75352E
          B3F133C57E1FF0AAEA7A9695A68964BC5B78D6398BA9051989C83D781F9D6178
          B7C09E2EBDD5741B9D42C4F889ADADB177B5D62563BC9D9904763D452F887C25
          AEEAFE058B49D2BC18DA4F91A8ACFE42DD097CC051833649E31C0FC695A3A01D
          E782FC51E2AD77520358D3B4E82CCC5BFCCB69F7B027A6464E2BBD1D2B9AF08F
          83346F0C5BACDA6E9E2D2EA7855673E63364819C7248EBE95D2D65269BD0A034
          9DE8A2A180514514FA0303451453109DE94514524002968A28433FFFD9}
        mmHeight = 21431
        mmLeft = 0
        mmTop = 0
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel164: TppLabel
        UserName = 'Label20'
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 23813
        mmTop = 1852
        mmWidth = 85725
        BandType = 0
      end
      object ppLabel165: TppLabel
        UserName = 'Label86'
        Caption = 'Diretoria de Benefícios - DIBEN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24077
        mmTop = 7144
        mmWidth = 49477
        BandType = 0
      end
      object ppLabel166: TppLabel
        UserName = 'Label87'
        Caption = 'Gerência de Atendimento - GERAT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24077
        mmTop = 11642
        mmWidth = 54769
        BandType = 0
      end
      object ppLabel167: TppLabel
        UserName = 'Label88'
        Caption = 'Coordenação de Empréstimos e Financiamentos - COEMF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24077
        mmTop = 16404
        mmWidth = 92075
        BandType = 0
      end
      object ppLabel168: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Demonstrativo de Valores em Aberto - Empréstimo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 20638
        mmTop = 23283
        mmWidth = 154517
        BandType = 0
      end
      object ppLabel169: TppLabel
        UserName = 'Label93'
        Caption = 'Central de Atendimento: 0800 706 9000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 149490
        mmTop = 15346
        mmWidth = 43127
        BandType = 0
      end
      object ppLabel170: TppLabel
        UserName = 'Label92'
        Caption = 'CEP: 70.712-900, Brasília - DF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 149490
        mmTop = 12171
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel171: TppLabel
        UserName = 'Label901'
        Caption = 'Ed. Corporate Financial Center'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 149490
        mmTop = 8996
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel172: TppLabel
        UserName = 'Label90'
        Caption = 'SCN. qd. 2 bl. A,12º e 13º andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 149490
        mmTop = 5821
        mmWidth = 37571
        BandType = 0
      end
      object ppLabel173: TppLabel
        UserName = 'Label89'
        Caption = 'www.funcef.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 149490
        mmTop = 2646
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel174: TppLabel
        UserName = 'Label65'
        Caption = 'Dados do Contrato de Empréstimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 2910
        mmTop = 32279
        mmWidth = 64294
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 529
        mmTop = 36513
        mmWidth = 196586
        BandType = 0
      end
      object ppLabel175: TppLabel
        UserName = 'Label66'
        Caption = 'Nº Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 38365
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel176: TppLabel
        UserName = 'Label68'
        Caption = 'Modalidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 38365
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel177: TppLabel
        UserName = 'Label70'
        Caption = 'Taxa de Juros Contratual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 82550
        mmTop = 38365
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel178: TppLabel
        UserName = 'Label72'
        Caption = 'Índice de Correção do Saldo Devedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 113242
        mmTop = 38365
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel179: TppLabel
        UserName = 'Label74'
        Caption = 'Prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 149490
        mmTop = 38365
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel180: TppLabel
        UserName = 'Label76'
        Caption = 'Data de Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 38365
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel181: TppLabel
        UserName = 'rptRelValorAtualizado_lblDataCredito'
        Caption = 'rptRelValorAtualizado_lblDataCredito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 47361
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel182: TppLabel
        UserName = 'rptRelValorAtualizado_lblPrazo'
        Caption = 'rptRelValorAtualizado_lblPrazo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 150548
        mmTop = 47361
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel183: TppLabel
        UserName = 'rptRelValorAtualizado_lblIndice'
        Caption = 'rptRelValorAtualizado_lblIndice'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 118004
        mmTop = 47361
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel184: TppLabel
        UserName = 'rptRelValorAtualizado_lblTaxa'
        AutoSize = False
        Caption = 'rptRelValorAtualizado_lblTaxa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 83344
        mmTop = 47361
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel185: TppLabel
        UserName = 'rptRelValorAtualizado_lblTipoContr'
        AutoSize = False
        Caption = 'rptRelValorAtualizado_lblTipoContr'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 47361
        mmWidth = 48683
        BandType = 0
      end
      object ppLabel186: TppLabel
        UserName = 'rptRelValorAtualizado_lblContrato'
        Caption = 'rptRelValorAtualizado_lblContrato'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 47361
        mmWidth = 19844
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape12: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 1852
        mmTop = 0
        mmWidth = 196057
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'rptRelValorAtualizado_Itens'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplValorAtualizado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 21431
        mmTop = 794
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText15'
        BlankWhenZero = True
        DataField = 'HMEDATAPREVISTA'
        DataPipeline = pplValorAtualizado
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 66940
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText6'
        DataField = 'PARCELAS'
        DataPipeline = pplValorAtualizado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 52123
        mmTop = 794
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'VLR_JUROSREMUNERA'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 154252
        mmTop = 794
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'VLR_ENCARGOS'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 168275
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText10'
        DataField = 'VLR_ATUALIZADO'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 184415
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText1'
        BlankWhenZero = True
        DataField = 'VLR_JUROSMORA'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 137584
        mmTop = 794
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText2'
        BlankWhenZero = True
        DataField = 'VLR_MULTA'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 121709
        mmTop = 794
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'VLR_CORRECAO'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 102923
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText4'
        BlankWhenZero = True
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 86784
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText21'
        DataField = 'ANOMES'
        DataPipeline = pplValorAtualizado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 794
        mmWidth = 13229
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object ppLine17: TppLine
        UserName = 'Line4'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 2646
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 69321
        mmTop = 3704
        mmWidth = 62971
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable2'
        AutoSize = False
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 168805
        mmTop = 3704
        mmWidth = 28840
        BandType = 8
      end
      object ppLabel187: TppLabel
        UserName = 'Label69'
        Caption = 
          '(1) Parcela: Número da parcela atual / Quantidade de parcelas re' +
          'stantes.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 3175
        mmTop = 7938
        mmWidth = 79375
        BandType = 8
      end
      object ppLabel188: TppLabel
        UserName = 'Label17'
        Caption = 
          '(2) INPC/IBGE - Índice Nacional de Preços ao Consumidor, informa' +
          'do pelo Instituto Brasileiro de Geografia e Estatística.  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 3175
        mmTop = 11113
        mmWidth = 132038
        BandType = 8
      end
      object ppLabel189: TppLabel
        UserName = 'Label71'
        Caption = '(3) Multa: 2%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 3175
        mmTop = 14288
        mmWidth = 14478
        BandType = 8
      end
      object ppLabel190: TppLabel
        UserName = 'Label73'
        Caption = '(4) Juros de Mora: 0,033 % (ao dia).'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 3175
        mmTop = 17463
        mmWidth = 39116
        BandType = 8
      end
      object ppLabel191: TppLabel
        UserName = 'Label75'
        Caption = '(5) Juros Remuneratórios: 7,9 % (ao ano)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 3175
        mmTop = 20638
        mmWidth = 45043
        BandType = 8
      end
      object ppLabel192: TppLabel
        UserName = 'Label77'
        Caption = 
          'Nota: FGQC (Fundo Garantidor para Quitação de Crédito) - Somente' +
          ' para as modalidades: Novo Credinâmico, Credinâmico e Crédito ao' +
          ' Participante para Integralização de Reserva Previdenciária.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5757
        mmLeft = 3175
        mmTop = 23283
        mmWidth = 187833
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 57679
      mmPrintPosition = 0
      object ppLabel193: TppLabel
        UserName = 'Label27'
        Caption = '100.000,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 175948
        mmTop = 21696
        mmWidth = 16140
        BandType = 7
      end
      object ppLabel194: TppLabel
        UserName = 'rptRelValorAtualizado_lblTotalDevido'
        Caption = '100.000,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 175948
        mmTop = 47625
        mmWidth = 16140
        BandType = 7
      end
      object ppLine18: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 153194
        mmTop = 1323
        mmWidth = 13229
        BandType = 7
      end
      object ppLine19: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 529
        mmLeft = 168011
        mmTop = 1323
        mmWidth = 13229
        BandType = 7
      end
      object ppLine20: TppLine
        UserName = 'Line6'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 182827
        mmTop = 1323
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VLR_CORRECAO'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 2879
        mmLeft = 102659
        mmTop = 2381
        mmWidth = 14288
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VLR_ATUALIZADO'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 2879
        mmLeft = 182827
        mmTop = 2381
        mmWidth = 14023
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'VLR_ENCARGOS'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 2879
        mmLeft = 168011
        mmTop = 2381
        mmWidth = 12965
        BandType = 7
      end
      object ppLine29: TppLine
        UserName = 'Line7'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 136261
        mmTop = 1323
        mmWidth = 14288
        BandType = 7
      end
      object ppLine30: TppLine
        UserName = 'Line8'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 120386
        mmTop = 1323
        mmWidth = 12171
        BandType = 7
      end
      object ppLine31: TppLine
        UserName = 'Line9'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 102659
        mmTop = 1323
        mmWidth = 14288
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'VLR_MULTA'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 2879
        mmLeft = 120386
        mmTop = 2381
        mmWidth = 12171
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VLR_JUROSMORA'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 2879
        mmLeft = 136261
        mmTop = 2381
        mmWidth = 14288
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'VLR_JUROSREMUNERA'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 2879
        mmLeft = 153194
        mmTop = 2381
        mmWidth = 13229
        BandType = 7
      end
      object ppLine32: TppLine
        UserName = 'Line10'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 86519
        mmTop = 1323
        mmWidth = 13494
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplValorAtualizado
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValorAtualizado'
        mmHeight = 2879
        mmLeft = 86519
        mmTop = 2381
        mmWidth = 13229
        BandType = 7
      end
      object ppLine33: TppLine
        UserName = 'Line23'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 93134
        mmTop = 10054
        mmWidth = 99219
        BandType = 7
      end
      object ppLabel195: TppLabel
        UserName = 'Label78'
        Caption = 'Resumo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 138642
        mmTop = 10848
        mmWidth = 15346
        BandType = 7
      end
      object ppLabel196: TppLabel
        UserName = 'Label79'
        Caption = 'Prestações (Valor Nominal + Encargos)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 93663
        mmTop = 21696
        mmWidth = 52917
        BandType = 7
      end
      object ppLabel197: TppLabel
        UserName = 'Label80'
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 150019
        mmTop = 16933
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel198: TppLabel
        UserName = 'Label801'
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 179917
        mmTop = 16669
        mmWidth = 6879
        BandType = 7
      end
      object ppLabel199: TppLabel
        UserName = 'Label82'
        Caption = 'FGQC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 93663
        mmTop = 26458
        mmWidth = 8202
        BandType = 7
      end
      object ppLine34: TppLine
        UserName = 'Line25'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 93134
        mmTop = 32015
        mmWidth = 99219
        BandType = 7
      end
      object ppLabel200: TppLabel
        UserName = 'Label83'
        Caption = 'Saldo Devedor Vencido:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 123296
        mmTop = 34396
        mmWidth = 35190
        BandType = 7
      end
      object ppLabel201: TppLabel
        UserName = 'Label84'
        Caption = 'Saldo Devedor a Vencer:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 122502
        mmTop = 40217
        mmWidth = 35983
        BandType = 7
      end
      object ppLabel202: TppLabel
        UserName = 'Label85'
        Caption = 'Saldo Devedor Total:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 128323
        mmTop = 47625
        mmWidth = 30163
        BandType = 7
      end
      object ppLine35: TppLine
        UserName = 'Line26'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 529
        mmLeft = 160867
        mmTop = 45773
        mmWidth = 31485
        BandType = 7
      end
      object ppLine36: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 93134
        mmTop = 52652
        mmWidth = 99219
        BandType = 7
      end
      object ppLabel203: TppLabel
        UserName = 'rptRelValorAtualizado_lblQtdePrestacoes'
        Caption = '1000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 155194
        mmTop = 21696
        mmWidth = 7112
        BandType = 7
      end
      object ppLabel204: TppLabel
        UserName = 'rptRelValorAtualizado_lblQtdeFGQC'
        Caption = '1000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 155311
        mmTop = 26458
        mmWidth = 7112
        BandType = 7
      end
      object ppLabel205: TppLabel
        UserName = 'rptRelValorAtualizado_lblVlrFGQC'
        Caption = '100.000,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 175948
        mmTop = 26458
        mmWidth = 16140
        BandType = 7
      end
      object ppLabel206: TppLabel
        UserName = 'rptRelValorAtualizado_lblVlrDevVencido'
        Caption = '100.000,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 175948
        mmTop = 34396
        mmWidth = 16140
        BandType = 7
      end
      object ppLine37: TppLine
        UserName = 'Line24'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 93134
        mmTop = 15346
        mmWidth = 99219
        BandType = 7
      end
      object ppLabel207: TppLabel
        UserName = 'rptRelValorAtualizado_lblVlrDevVencer'
        Caption = '100.000,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 175948
        mmTop = 40217
        mmWidth = 16140
        BandType = 7
      end
      object ppLabel208: TppLabel
        UserName = 'Label25'
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 3175
        mmTop = 1588
        mmWidth = 6879
        BandType = 7
      end
      object ppLine38: TppLine
        UserName = 'Line11'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 7
      end
    end
  end
end
