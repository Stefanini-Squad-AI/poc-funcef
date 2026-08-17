inherited frmParamEmptmo: TfrmParamEmptmo
  Left = 421
  Top = 85
  HelpContext = 230005
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 596
  ClientWidth = 498
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 498
    Height = 528
    object pgcParametros: TPageControl
      Left = 1
      Top = 1
      Width = 496
      Height = 526
      ActivePage = tbsConcessao
      Align = alClient
      MultiLine = True
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = 'Geral'
        ImageIndex = 2
        object Label2: TLabel
          Left = 32
          Top = 10
          Width = 183
          Height = 13
          Caption = 'Grupo de Regras de Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 32
          Top = 50
          Width = 254
          Height = 13
          Caption = 'Documento utilizado para validação do óbito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBcboGrupoRegra: TwwDBLookupCombo
          Left = 32
          Top = 24
          Width = 425
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
          DataField = 'IDGRUPOREGRA'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookGrupoRegra
          LookupField = 'IDGRUPOREGRA'
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object GroupBox1: TGroupBox
          Left = 32
          Top = 93
          Width = 425
          Height = 105
          Caption = ' "Domicílio" para Feriados / Dias Úteis '
          TabOrder = 1
          object Label7: TLabel
            Left = 16
            Top = 58
            Width = 40
            Height = 13
            Caption = 'Estado'
          end
          object Label8: TLabel
            Left = 16
            Top = 18
            Width = 40
            Height = 13
            Caption = 'Cidade'
          end
          object Label9: TLabel
            Left = 200
            Top = 58
            Width = 27
            Height = 13
            Caption = 'País'
          end
          object DBedtCidade: TDBEdit
            Left = 16
            Top = 32
            Width = 345
            Height = 21
            DataField = 'NOME_CIDADE'
            DataSource = ds
            Enabled = False
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 16
            Top = 72
            Width = 49
            Height = 21
            DataField = 'CODESTADO'
            DataSource = ds
            Enabled = False
            TabOrder = 3
          end
          object DBEdit3: TDBEdit
            Left = 200
            Top = 72
            Width = 209
            Height = 21
            DataField = 'NOMEPAIS'
            DataSource = ds
            Enabled = False
            TabOrder = 5
          end
          object btnBuscaCidade: TBitBtn
            Left = 360
            Top = 32
            Width = 24
            Height = 22
            Hint = 'Busca uma Cidade'
            TabOrder = 1
            OnClick = btnBuscaCidadeClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
              777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
              77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
              77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
              077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
              FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
              F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
              7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
              777777787FFF8777777777770000777777777777888877777777}
            NumGlyphs = 2
          end
          object btnLimpaCidade: TBitBtn
            Left = 384
            Top = 32
            Width = 24
            Height = 22
            Hint = 'Limpa a seleção de Cidade'
            Enabled = False
            TabOrder = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888FF8888888888888008888888888888F77F8888888888800F08888
              8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
              88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
              888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
              0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
              03088878F88878F878788887F8888090B03088878F888787878788887888880B
              0B038888788888787878888888888880B0B38888888888878788888888888888
              0BBB88888888888878F888888888888880BB8888888888888788}
            NumGlyphs = 2
          end
          object DBEdit4: TDBEdit
            Left = 64
            Top = 72
            Width = 121
            Height = 21
            DataField = 'NOMEESTADO'
            DataSource = ds
            Enabled = False
            TabOrder = 4
          end
        end
        object DBCheckBox3: TDBCheckBox
          Left = 40
          Top = 221
          Width = 417
          Height = 17
          Caption = 'Oferecer a opção de impressão do Contrato na Inscrição'
          DataField = 'FLGIMPRINSCRICAO'
          DataSource = ds
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox4: TDBCheckBox
          Left = 40
          Top = 269
          Width = 417
          Height = 17
          Caption = 'Gerar automaticamente Rubricas para cada Item de Empréstimo'
          DataField = 'FLGGERARUBRICA'
          DataSource = ds
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox6: TDBCheckBox
          Left = 40
          Top = 245
          Width = 417
          Height = 17
          Caption = 'Oferecer a opção de impressão do Contrato na Concessão'
          DataField = 'FLGIMPRIMEINSC'
          DataSource = ds
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 40
          Top = 357
          Width = 417
          Height = 17
          Caption = 'Permitir suspensão automática de cobrança por Regra'
          Color = clGray
          DataField = 'FLGSUSPENSAOAUTO'
          DataSource = ds
          ParentColor = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
          Visible = False
        end
        object DBCheckBox15: TDBCheckBox
          Left = 40
          Top = 293
          Width = 417
          Height = 17
          Caption = 'NÃO exibir dados do participante titular (apenas do Mutuário)'
          DataField = 'FLGMOSTRATIT'
          DataSource = ds
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox26: TDBCheckBox
          Left = 40
          Top = 317
          Width = 417
          Height = 17
          Caption = 'Fundação inscrita como optante pelo RET'
          DataField = 'FLGINSCRET'
          DataSource = ds
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox12: TDBCheckBox
          Left = 40
          Top = 341
          Width = 417
          Height = 17
          Caption = 'Saldo devedor atualizado DIARIAMENTE'
          DataField = 'FLGCALCDIA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dboIDDOCUMENTO: TwwDBLookupCombo
          Left = 32
          Top = 64
          Width = 425
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEDOCUMENTO'#9'30'#9'Descrição'#9'F')
          DataField = 'IDDOCUMENTO'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookTipoDocPessoa
          LookupField = 'IDDOCUMENTO'
          DropDownWidth = 8
          TabOrder = 9
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
      object tbsSaldoDev: TTabSheet
        Caption = 'Saldo Devedor'
        ImageIndex = 4
        object Label28: TLabel
          Left = 32
          Top = 194
          Width = 434
          Height = 13
          Caption = 
            'Item de Empréstimo para incorporação ao saldo de débitos não pro' +
            'gramados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 32
          Top = 234
          Width = 426
          Height = 13
          Caption = 
            'Item de Empréstimo para abatimento do saldo de créditos não prog' +
            'ramados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBRadioGroup4: TDBRadioGroup
          Left = 32
          Top = 8
          Width = 425
          Height = 49
          Caption = ' Saldo devedor "anterior" para uma determindada data: '
          DataField = 'FLGSALDODEVANT'
          DataSource = ds
          Items.Strings = (
            'É o Saldo Devedor na própria data'
            'É o Saldo Devedor no dia anterior à data')
          TabOrder = 0
          Values.Strings = (
            '0'
            '1')
        end
        object DBRadioGroup3: TDBRadioGroup
          Left = 32
          Top = 64
          Width = 425
          Height = 65
          Caption = ' A Data de Atualização do Saldo Devedor (na concessão): '
          DataField = 'FLGDATAATUSLD'
          DataSource = ds
          Items.Strings = (
            'É a Data do Crédito'
            'É a Data da 1º Parcela'
            'É a data equivalente, no mês anterior, à Data da 1ª Parcela')
          TabOrder = 1
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object DBRadioGroup5: TDBRadioGroup
          Left = 32
          Top = 136
          Width = 425
          Height = 49
          Caption = 
            ' Considerar Itens em aberto de Contratos Anteriores (para Renova' +
            'ção): '
          DataField = 'FLGPENDCONCESSAO'
          DataSource = ds
          Items.Strings = (
            'Até a data de concessão do novo Contrato'
            'Até o último dia do mês de concessão do novo Contrato')
          TabOrder = 2
          Values.Strings = (
            '0'
            '1')
        end
        inline molRegraDB2: TmolRegraDB
          Left = 24
          Top = 296
          Width = 441
          Color = clBtnShadow
          ParentColor = False
          TabOrder = 5
          Visible = False
          inherited Regra: TLabel
            Width = 330
            Caption = 'Regra de Cálculo de Atualização Diária de Saldo Devedor'
          end
          inherited DBedtRegra: TDBEdit
            Left = 56
            Width = 329
            DataField = 'REGRAATU'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 384
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 408
          end
          inherited DBedtIDRegra: TDBEdit
            Width = 49
            DataField = 'IDREGRAATUALDIA'
            DataSource = ds
          end
        end
        object wwDBLookupCombo9: TwwDBLookupCombo
          Left = 32
          Top = 208
          Width = 425
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDITEMSLDMAIS'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookItemEmprestimo
          LookupField = 'IDITEMEMPTMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object wwDBLookupCombo10: TwwDBLookupCombo
          Left = 32
          Top = 248
          Width = 425
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDITEMSLDMENOS'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookItemEmprestimo
          LookupField = 'IDITEMEMPTMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
      object tbsConcessao: TTabSheet
        Caption = 'Concessão'
        object Label3: TLabel
          Left = 32
          Top = 4
          Width = 215
          Height = 13
          Caption = 'Forma de Pagamento para Concessão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 32
          Top = 44
          Width = 315
          Height = 13
          Caption = 'Conta de Caixa x Forma de Pagamento para Concessão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 224
          Top = 388
          Width = 149
          Height = 13
          Caption = 'Horário de encerramento: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel4: TBevel
          Left = 32
          Top = 106
          Width = 425
          Height = 2
          Shape = bsTopLine
        end
        object Bevel5: TBevel
          Left = 32
          Top = 134
          Width = 425
          Height = 2
          Shape = bsTopLine
        end
        object Bevel6: TBevel
          Left = 32
          Top = 258
          Width = 425
          Height = 2
          Shape = bsTopLine
        end
        object Bevel7: TBevel
          Left = 32
          Top = 365
          Width = 425
          Height = 2
          Shape = bsTopLine
        end
        object Bevel16: TBevel
          Left = 32
          Top = 300
          Width = 425
          Height = 2
          Shape = bsTopLine
        end
        object Bevel17: TBevel
          Left = 32
          Top = 206
          Width = 425
          Height = 2
          Shape = bsTopLine
        end
        object lblEventoAJ: TLabel
          Left = 35
          Top = 432
          Width = 308
          Height = 13
          Caption = 'Evento de Cobrança para novação por acordo judicial'
        end
        object Label37: TLabel
          Left = 97
          Top = 413
          Width = 273
          Height = 13
          Caption = 'Horário de encerramento diário para os Débitos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBrdgFormaPort: TDBRadioGroup
          Left = 512
          Top = 94
          Width = 273
          Height = 65
          Caption = ' Permitir a escolha '
          Color = clGray
          DataField = 'FLGFORMAPORT'
          DataSource = ds
          Items.Strings = (
            'da Forma de Pagamento'
            'da Conta de Caixa x Forma de Pagamento')
          ParentColor = False
          TabOrder = 12
          Values.Strings = (
            'F'
            'P')
          Visible = False
        end
        object DBCheckBox1: TDBCheckBox
          Left = 32
          Top = 114
          Width = 417
          Height = 17
          Caption = 'Verificar disponibilidade de Verba para concessão'
          DataField = 'FLGOBRIGAVERBA'
          DataSource = ds
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBcboFormaPagto: TwwDBLookupCombo
          Left = 32
          Top = 18
          Width = 425
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'30'#9'DESCRICAO'#9'F')
          DataField = 'CODFORMAPAGTO'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookFormaRecPag
          LookupField = 'CODFORMA'
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object DBcboPortFormaPagto: TwwDBLookupCombo
          Left = 32
          Top = 58
          Width = 425
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
          DataField = 'PORTFORMAPAGTO'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookPortadorFormaP
          LookupField = 'CODPORTFORMA'
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object DBCheckBox8: TDBCheckBox
          Left = 344
          Top = 114
          Width = 137
          Height = 17
          Caption = 'Utilizar Verba única'
          DataField = 'FLGVERBAUNICA'
          DataSource = ds
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox11: TDBCheckBox
          Left = 32
          Top = 372
          Width = 417
          Height = 17
          Caption = 'NÃO Permitir concessão no último dia útil do mês'
          DataField = 'FLGCONCULTDIAMES'
          DataSource = ds
          TabOrder = 10
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox14: TDBCheckBox
          Left = 82
          Top = 178
          Width = 373
          Height = 17
          Caption = 'Obriga informação de Avalista(s) quando participante Mantido'
          DataField = 'FLGOBRIGAAVALISTA'
          DataSource = ds
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox16: TDBCheckBox
          Left = 32
          Top = 344
          Width = 417
          Height = 17
          Caption = 'Permitir inscrições/concessões com data retroativa'
          DataField = 'FLGTRAVARDATA'
          DataSource = ds
          TabOrder = 9
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox17: TDBCheckBox
          Left = 32
          Top = 308
          Width = 417
          Height = 17
          Caption = 'Tratar assinatura de contrato padrão'
          DataField = 'FLGTRATAASSINAT'
          DataSource = ds
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        inline molRegraDB4: TmolRegraDB
          Left = 24
          Top = 138
          Width = 441
          TabOrder = 6
          inherited Regra: TLabel
            Top = 1
            Width = 285
            Caption = 'Regra de controle de obrigatoriedade de avalistas'
          end
          inherited DBedtRegra: TDBEdit
            Left = 56
            Width = 329
            DataField = 'NOMEREGRA'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 384
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 408
          end
          inherited DBedtIDRegra: TDBEdit
            Width = 49
            DataField = 'IDREGRAAVAL'
            DataSource = ds
          end
        end
        object dbEdtHoraEncerra: TDBEdit
          Left = 376
          Top = 384
          Width = 81
          Height = 21
          DataField = 'HORAENCERRA'
          DataSource = ds
          TabOrder = 11
        end
        object DBCheckBox27: TDBCheckBox
          Left = 32
          Top = 82
          Width = 417
          Height = 17
          Caption = 'Levar em conta Float para Concessão'
          DataField = 'FLGUSAFLOATCONC'
          DataSource = ds
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox28: TDBCheckBox
          Left = 32
          Top = 326
          Width = 417
          Height = 17
          Caption = 'Controlar recebimento de Contrato para permitir Concessão'
          DataField = 'FLGCONTROLAINSC'
          DataSource = ds
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox31: TDBCheckBox
          Left = 32
          Top = 263
          Width = 417
          Height = 17
          Caption = 
            'Utiliza cálculo de Margem Consignável Alternativa (Fundação + IN' +
            'SS)'
          DataField = 'FLGUSAMARGEMALT'
          DataSource = ds
          TabOrder = 13
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox35: TDBCheckBox
          Left = 32
          Top = 281
          Width = 417
          Height = 17
          Caption = 'Obriga Avalista se selecionada a Margem Consignável Alternativa'
          DataField = 'FLGOBRIGAAVALALT'
          DataSource = ds
          TabOrder = 14
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        inline molRegraDB5: TmolRegraDB
          Left = 24
          Top = 210
          Width = 441
          TabOrder = 15
          inherited Regra: TLabel
            Top = 1
            Width = 260
            Caption = 'Regra de identificação do Plano de Cobrança'
          end
          inherited DBedtRegra: TDBEdit
            Left = 56
            Width = 329
            DataField = 'REGRAPLANOCOB'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 384
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 408
          end
          inherited DBedtIDRegra: TDBEdit
            Width = 49
            DataField = 'IDREGRAPLANOCOB'
            DataSource = ds
          end
        end
        object cbCboEvento: TwwDBLookupCombo
          Left = 32
          Top = 448
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCEVENTOCOB'#9'60'#9#9'F')
          DataField = 'IDEVENTOJUDICIAL'
          DataSource = ds
          LookupTable = qryEvento
          LookupField = 'IDTIPOEVENTOCOBEMPTMO'
          TabOrder = 16
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object dbEdtHoraEncerraDebito: TDBEdit
          Left = 376
          Top = 409
          Width = 81
          Height = 21
          DataField = 'HORAENCERRADEBITO'
          DataSource = ds
          TabOrder = 17
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Envio'
        ImageIndex = 8
        object Label30: TLabel
          Left = 64
          Top = 288
          Width = 183
          Height = 13
          Caption = 'prestações anteriores em aberto'
          Color = clBtnShadow
          ParentColor = False
          Visible = False
        end
        object Bevel12: TBevel
          Left = 32
          Top = 136
          Width = 425
          Height = 2
          Shape = bsTopLine
        end
        object Bevel13: TBevel
          Left = 32
          Top = 184
          Width = 425
          Height = 2
          Shape = bsTopLine
        end
        object Bevel14: TBevel
          Left = 32
          Top = 256
          Width = 425
          Height = 2
          Shape = bsTopLine
        end
        object DBCheckBox32: TDBCheckBox
          Left = 40
          Top = 24
          Width = 425
          Height = 17
          Caption = 'NÃO enviar para Contas a Pagar no momento da Concessão'
          Color = clBtnFace
          DataField = 'FLGINTEGRACONC'
          DataSource = ds
          ParentColor = False
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox33: TDBCheckBox
          Left = 40
          Top = 200
          Width = 425
          Height = 17
          Caption = 
            'Agrupar Parcelas no Envio para Financeiro (1 parcela por Documen' +
            'to)'
          Color = clBtnFace
          DataField = 'FLGAGRUPAPARC'
          DataSource = ds
          ParentColor = False
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox34: TDBCheckBox
          Left = 40
          Top = 224
          Width = 425
          Height = 17
          Caption = 'Agrupar Parcelas no Envio para Folha(s)'
          Color = clBtnFace
          DataField = 'FLGAGRUPAPARCFOL'
          DataSource = ds
          ParentColor = False
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox19: TDBCheckBox
          Left = 40
          Top = 152
          Width = 425
          Height = 17
          Caption = 'NÃO executar Envio de itens com divergência'
          DataField = 'FLGENVIODIVERG'
          DataSource = ds
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox37: TDBCheckBox
          Left = 40
          Top = 48
          Width = 425
          Height = 17
          Caption = 'NÃO enviar para Contas a Receber no momento da Amortização'
          Color = clBtnFace
          DataField = 'FLGENVIAAMORTIZA'
          DataSource = ds
          ParentColor = False
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox38: TDBCheckBox
          Left = 40
          Top = 72
          Width = 425
          Height = 17
          Caption = 'NÃO enviar para Contas a Receber no momento da Quitação'
          Color = clBtnFace
          DataField = 'FLGENVIAQUITA'
          DataSource = ds
          ParentColor = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox40: TDBCheckBox
          Left = 40
          Top = 96
          Width = 435
          Height = 17
          Caption = 
            'Utilizar SEMPRE conta corrente preferencial no envio para o Fina' +
            'nceiro'
          Color = clBtnFace
          DataField = 'FLGCTABANCOPREF'
          DataSource = ds
          ParentColor = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Outros Processos'
        ImageIndex = 5
        object Bevel8: TBevel
          Left = 24
          Top = 80
          Width = 433
          Height = 2
          Shape = bsTopLine
        end
        object Label19: TLabel
          Left = 52
          Top = 63
          Width = 94
          Height = 13
          Caption = 'com divergência'
        end
        object Bevel9: TBevel
          Left = 24
          Top = 151
          Width = 433
          Height = 2
          Shape = bsTopLine
        end
        object Bevel10: TBevel
          Left = 24
          Top = 199
          Width = 433
          Height = 2
          Shape = bsTopLine
        end
        object Label24: TLabel
          Left = 24
          Top = 280
          Width = 291
          Height = 13
          Caption = 'Item de Empréstimo referente a Provisão de Perdas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel11: TBevel
          Left = 24
          Top = 227
          Width = 433
          Height = 2
          Shape = bsTopLine
        end
        object Label27: TLabel
          Left = 24
          Top = 328
          Width = 426
          Height = 13
          Caption = 
            'Item de Empréstimo para cobrança/devolução de valores não progra' +
            'mados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel15: TBevel
          Left = 24
          Top = 275
          Width = 433
          Height = 2
          Shape = bsTopLine
        end
        object Label34: TLabel
          Left = 52
          Top = 23
          Width = 88
          Height = 13
          Caption = 'ao mês anterior'
        end
        object DBCheckBox18: TDBCheckBox
          Left = 32
          Top = 43
          Width = 425
          Height = 17
          Caption = 
            'NÃO gerar Parcelas para Contratos que possuírem itens (anteriore' +
            's)'
          DataField = 'FLGPARCDIVERG'
          DataSource = ds
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox20: TDBCheckBox
          Left = 32
          Top = 206
          Width = 425
          Height = 17
          Caption = 'Cancelar automaticamente Amortizações e Quitações não recebidas'
          Color = clBtnFace
          DataField = 'FLGTRATQUITCANC'
          DataSource = ds
          ParentColor = False
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox9: TDBCheckBox
          Left = 32
          Top = 87
          Width = 425
          Height = 17
          Caption = 'NÃO permitir Amortização se houver prestação anterior em aberto'
          DataField = 'FLGAMTPRESTAB'
          DataSource = ds
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox10: TDBCheckBox
          Left = 32
          Top = 130
          Width = 425
          Height = 17
          Caption = 'NÃO permitir Renovação se houver prestação anterior em aberto'
          DataField = 'FLGRENPRESTAB'
          DataSource = ds
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox24: TDBCheckBox
          Left = -32
          Top = 364
          Width = 433
          Height = 17
          Caption = 'Fundação trabalha com Excepcionalizações '
          Color = clGray
          DataField = 'FLGEXCEPCIONAL'
          DataSource = ds
          ParentColor = False
          TabOrder = 10
          ValueChecked = '1'
          ValueUnchecked = '0'
          Visible = False
        end
        object DBchkQuitaParcMorte: TDBCheckBox
          Left = 32
          Top = 158
          Width = 425
          Height = 17
          Caption = 'Não liquidar itens em aberto na Quitação por Morte'
          Color = clBtnFace
          DataField = 'FLGQUITAPARCMORTE'
          DataSource = ds
          ParentColor = False
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object wwDBLookupCombo5: TwwDBLookupCombo
          Left = 24
          Top = 294
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDITEMPROVPERDA'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookItemEmprestimo
          LookupField = 'IDITEMEMPTMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 8
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object wwDBLookupCombo8: TwwDBLookupCombo
          Left = 24
          Top = 342
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDITEMINESPERADO'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookItemEmprestimo
          LookupField = 'IDITEMEMPTMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 9
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object DBCheckBox36: TDBCheckBox
          Left = 32
          Top = 178
          Width = 425
          Height = 17
          Caption = 'ESTORNAR os itens posteriores à data de Quitação'
          Color = clBtnFace
          DataField = 'FLGESTORNOPOSQUIT'
          DataSource = ds
          ParentColor = False
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox25: TDBCheckBox
          Left = 32
          Top = 234
          Width = 425
          Height = 17
          Caption = 'ESTORNAR Documentos CaP/CaR no Tratamento de Divergências'
          Color = clBtnFace
          DataField = 'FLGESTORNADIVERG'
          DataSource = ds
          ParentColor = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox39: TDBCheckBox
          Left = 32
          Top = 254
          Width = 425
          Height = 17
          Caption = 'Passar itens abonados para regras de encargos'
          Color = clBtnFace
          DataField = 'FLGABONODIVERG'
          DataSource = ds
          ParentColor = False
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox30: TDBCheckBox
          Left = 32
          Top = 109
          Width = 425
          Height = 17
          Caption = 
            'Permitir Amortização com Data Retroativa à última atualização de' +
            ' saldo'
          DataField = 'FLGAMORTRETROATIV'
          DataSource = ds
          TabOrder = 11
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox41: TDBCheckBox
          Left = 32
          Top = 8
          Width = 425
          Height = 17
          Caption = 'NÃO gerar Parcelas SE NÃO EXISTIR atualização de saldo referente'
          DataField = 'FLGTRATAATUSLD'
          DataSource = ds
          TabOrder = 12
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Integrações'
        ImageIndex = 3
        object Bevel3: TBevel
          Left = 24
          Top = 305
          Width = 449
          Height = 2
          Shape = bsTopLine
        end
        object Label16: TLabel
          Left = 32
          Top = 297
          Width = 172
          Height = 13
          Caption = ' "Destino" padrão para Envio '
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 68
          Top = 60
          Width = 183
          Height = 13
          Caption = 'prestações anteriores em aberto'
        end
        object Label35: TLabel
          Left = 32
          Top = 240
          Width = 290
          Height = 13
          Caption = 'Rubrica para envio de valores na folha de resgate:'
        end
        object DBCheckBox5: TDBCheckBox
          Left = 32
          Top = 4
          Width = 441
          Height = 17
          Caption = 'Integrar com Contas a Pagar / Receber CM'
          DataField = 'FLGINTEGRACAPCAR'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox7: TDBCheckBox
          Left = 32
          Top = 80
          Width = 441
          Height = 17
          Caption = 'Integrar com Contabilidade CM'
          DataField = 'FLGINTEGRACONTAB'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 24
          Top = 316
          Width = 217
          Height = 51
          Caption = ' Concessão '
          DataField = 'FLGFORMAPAG'
          DataSource = ds
          Items.Strings = (
            'Contas a Pagar'
            'Folha')
          TabOrder = 8
          Values.Strings = (
            'C'
            'F')
        end
        object DBRadioGroup2: TDBRadioGroup
          Left = 256
          Top = 316
          Width = 217
          Height = 51
          Caption = ' Prestação '
          DataField = 'FLGFORMAREC'
          DataSource = ds
          Items.Strings = (
            'Contas a Receber'
            'Folha')
          TabOrder = 9
          Values.Strings = (
            'C'
            'F')
        end
        object DBchkFiario: TDBCheckBox
          Left = 32
          Top = 212
          Width = 441
          Height = 17
          Caption = 'Gerar Protocolo automaticamente para eventos de Empréstimo'
          DataField = 'FLGUSAFIARIO'
          DataSource = ds
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox13: TDBCheckBox
          Left = 48
          Top = 44
          Width = 425
          Height = 17
          Caption = 
            'Suspender cobrança de prestações (para financeiro)  quando houve' +
            'r'
          DataField = 'FLGSUSPENDEATRASO'
          DataSource = ds
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox21: TDBCheckBox
          Left = 48
          Top = 100
          Width = 425
          Height = 17
          Caption = 'NÃO contabilizar no momento da Concessão'
          Color = clBtnFace
          DataField = 'FLGCONTABCONC'
          DataSource = ds
          ParentColor = False
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox22: TDBCheckBox
          Left = 48
          Top = 120
          Width = 425
          Height = 17
          Caption = 'NÃO contabilizar no momento da Geração de Parcelas'
          Color = clBtnFace
          DataField = 'FLGCONTABPARCELA'
          DataSource = ds
          ParentColor = False
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox23: TDBCheckBox
          Left = 48
          Top = 140
          Width = 425
          Height = 17
          Caption = 'NÃO contabilizar no momento da Quitação e Amortização'
          Color = clBtnFace
          DataField = 'FLGINTEGRAQUITA'
          DataSource = ds
          ParentColor = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object chkContabilizaEncargo: TDBCheckBox
          Left = 48
          Top = 160
          Width = 425
          Height = 17
          Caption = 'NÃO contabilizar no momento da Geração dos Encargos'
          Color = clBtnFace
          DataField = 'FLGCONTABENCARGO'
          DataSource = ds
          ParentColor = False
          TabOrder = 10
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBchkEnviaConcessao: TDBCheckBox
          Left = 48
          Top = 24
          Width = 425
          Height = 17
          Caption = 'NÃO enviar para Contas a Pagar no momento da Concessão'
          Color = clBtnFace
          DataField = 'FLGINTEGRACONC'
          DataSource = ds
          ParentColor = False
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox29: TDBCheckBox
          Left = 48
          Top = 180
          Width = 425
          Height = 17
          Caption = 'Obrigar lançamentos contábeis em Partida Dobrada'
          Color = clBtnFace
          DataField = 'FLGPARTIDADOBRADA'
          DataSource = ds
          ParentColor = False
          TabOrder = 11
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbeIDPROVENTO: TDBEdit
          Left = 32
          Top = 255
          Width = 69
          Height = 21
          DataField = 'IDPROVENTO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 12
        end
        object DBcboRubEmprestimo: TwwDBLookupCombo
          Left = 181
          Top = 254
          Width = 293
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'130'#9'DESCRICAO'#9'F')
          DataField = 'IDPROVENTO'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookRubricaParaEnvio
          LookupField = 'IDPROVENTO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 13
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnCloseUp = DBcboRubEmprestimoCloseUp
        end
        object dblCODPROVDESC: TDBEdit
          Left = 106
          Top = 255
          Width = 69
          Height = 21
          DataField = 'CODPROVDESC'
          DataSource = dtmLookEmptmo.dsLookRubricaParaEnvio
          ReadOnly = True
          TabOrder = 14
        end
      end
      object tbsIntegra: TTabSheet
        Caption = 'Parâmetros p/ Integração - Financeiro'
        ImageIndex = 1
        object Label5: TLabel
          Left = 24
          Top = 34
          Width = 334
          Height = 13
          Caption = 'Conta de Caixa x Forma de Recebimento para Empréstimos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 24
          Top = 90
          Width = 284
          Height = 13
          Caption = 'Programa a ser indicado na Integração Financeira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 24
          Top = 186
          Width = 313
          Height = 13
          Caption = 'Tipo de Documento para Pagamentos (Contas a Pagar)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 24
          Top = 226
          Width = 339
          Height = 13
          Caption = 'Tipo de Documento para Recebimentos (Contas a Receber)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel1: TBevel
          Left = 24
          Top = 16
          Width = 433
          Height = 2
          Shape = bsTopLine
        end
        object Label1: TLabel
          Left = 32
          Top = 10
          Width = 158
          Height = 13
          Caption = ' Contas a Pagar / Receber '
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 24
          Top = 130
          Width = 322
          Height = 13
          Caption = 'Centro de Custo a ser indicado na Integração Financeira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBcboPortFormaRecto: TwwDBLookupCombo
          Left = 24
          Top = 48
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
          DataField = 'PORTFORMARECTO'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookPortadorFormaR
          LookupField = 'CODPORTFORMA'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object DBcboPrograma: TwwDBLookupCombo
          Left = 24
          Top = 104
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCPROGRAMA'#9'60'#9'DESCPROGRAMA'#9'F')
          DataField = 'IDPROGRAMA'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookPrograma
          LookupField = 'IDPROGRAMA'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object DBcboTipoDocPag: TwwDBLookupCombo
          Left = 24
          Top = 200
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO'#9'F')
          DataField = 'TIPODOCPAG'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookTipoDocPag
          LookupField = 'CODTIPDOC'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
        end
        object DBcboTipoDocRec: TwwDBLookupCombo
          Left = 24
          Top = 240
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO'#9'F')
          DataField = 'TIPODOCREC'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookTipoDocRec
          LookupField = 'CODTIPDOC'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
        end
        object DBcboCentroCusto: TwwDBLookupCombo
          Left = 24
          Top = 144
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'NOME'#9'F')
          DataField = 'CODCENTROCUSTO'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookCentroCusto
          LookupField = 'CODCENTROCUSTO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'I.O.F.'
        ImageIndex = 7
        TabVisible = False
        object Label14: TLabel
          Left = 24
          Top = 34
          Width = 220
          Height = 13
          Caption = 'Item de Empréstimo referente ao I.O.F.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 24
          Top = 130
          Width = 410
          Height = 13
          Caption = 
            'Item de Empréstimo referente ao I.O.F. Complementar - Refinancia' +
            'mento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 24
          Top = 82
          Width = 377
          Height = 13
          Caption = 'Item de Empréstimo referente ao I.O.F. Complementar - Concessão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel2: TBevel
          Left = 24
          Top = 16
          Width = 433
          Height = 2
          Shape = bsTopLine
        end
        object Label13: TLabel
          Left = 32
          Top = 10
          Width = 37
          Height = 13
          Caption = ' I.O.F '
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBcboItemIOF: TwwDBLookupCombo
          Left = 24
          Top = 48
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDITEMIOF'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookItemEmprestimo
          LookupField = 'IDITEMEMPTMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object DBcboIOFCompl: TwwDBLookupCombo
          Left = 24
          Top = 144
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDITEMIOFCOMPL'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookItemEmprestimo
          LookupField = 'IDITEMEMPTMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object wwDBLookupCombo7: TwwDBLookupCombo
          Left = 24
          Top = 96
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDITEMIOFCOMPLCON'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookItemEmprestimo
          LookupField = 'IDITEMEMPTMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
      object tbsSeguro: TTabSheet
        Caption = 'Seguro'
        ImageIndex = 6
        object Label20: TLabel
          Left = 24
          Top = 58
          Width = 388
          Height = 13
          Caption = 'Item de Empréstimo referente a Devolução de Seguro na Concessão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 24
          Top = 18
          Width = 312
          Height = 13
          Caption = 'Item de Empréstimo referente ao Seguro na Concessão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 24
          Top = 98
          Width = 377
          Height = 13
          Caption = 'Item de Empréstimo referente a Devolução de Seguro na Quitação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 24
          Top = 138
          Width = 428
          Height = 13
          Caption = 
            'Item de Empréstimo referente ao Seguro Complementar no Refinanci' +
            'amento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 24
          Top = 178
          Width = 434
          Height = 13
          Caption = 
            'Item de Empréstimo referente ao Seguro Complementar sobre Saldo ' +
            'Devedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Regra: TLabel
          Left = 24
          Top = 274
          Width = 66
          Height = 13
          Caption = 'Seguradora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 24
          Top = 312
          Width = 417
          Height = 13
          Caption = 
            '(Se este campo estiver preenchido, o valor de quitações por fale' +
            'cimento '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 24
          Top = 328
          Width = 214
          Height = 13
          Caption = 'será cobrado da Seguradora indicada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object wwDBLookupCombo2: TwwDBLookupCombo
          Left = 24
          Top = 32
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDITEMSEGCONC'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookItemEmprestimo
          LookupField = 'IDITEMEMPTMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object wwDBLookupCombo3: TwwDBLookupCombo
          Left = 24
          Top = 112
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDITEMDEVSEGQUIT'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookItemEmprestimo
          LookupField = 'IDITEMEMPTMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object wwDBLookupCombo4: TwwDBLookupCombo
          Left = 24
          Top = 152
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDITEMSEGCOMPL'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookItemEmprestimo
          LookupField = 'IDITEMEMPTMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        inline molRegraDB1: TmolRegraDB
          Left = 16
          Top = 224
          Width = 457
          TabOrder = 5
          TabStop = True
          inherited Regra: TLabel
            Width = 433
            Caption = 
              'Regra de Cálculo para Devolução de Prestações pagas ao(s) Benefi' +
              'ciário(s)'
          end
          inherited DBedtRegra: TDBEdit
            Left = 56
            Width = 337
            DataField = 'REGRADEV'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 392
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 416
          end
          inherited DBedtIDRegra: TDBEdit
            Width = 49
            DataField = 'IDREGRADEVSEG'
            DataSource = ds
          end
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 24
          Top = 72
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDITEMDEVSEGCONC'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookItemEmprestimo
          LookupField = 'IDITEMEMPTMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object wwDBLookupCombo6: TwwDBLookupCombo
          Left = 24
          Top = 192
          Width = 433
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDITEMSEGESPECIAL'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookItemEmprestimo
          LookupField = 'IDITEMEMPTMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object btnBuscaSeguradora: TBitBtn
          Left = 408
          Top = 288
          Width = 24
          Height = 22
          Hint = 'Busca uma Seguradora'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = btnBuscaSeguradoraClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
        end
        object DBedtRegra: TDBEdit
          Left = 24
          Top = 288
          Width = 385
          Height = 21
          DataField = 'NOME_SEGURADORA'
          DataSource = ds
          Enabled = False
          TabOrder = 6
        end
        object btnLimpaSeguradora: TBitBtn
          Left = 432
          Top = 288
          Width = 24
          Height = 22
          Hint = 'Limpa a seleção de Seguradora'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnClick = btnLimpaSeguradoraClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888FF8888888888888008888888888888F77F8888888888800F08888
            8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
            88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
            888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
            0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
            03088878F88878F878788887F8888090B03088878F888787878788887888880B
            0B038888788888787878888888888880B0B38888888888878788888888888888
            0BBB88888888888878F888888888888880BB8888888888888788}
          NumGlyphs = 2
        end
      end
      object tbsValidaConcessao: TTabSheet
        Caption = 'Validação na Concessão'
        ImageIndex = 9
        object Label33: TLabel
          Left = 8
          Top = 194
          Width = 5
          Height = 13
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inline molRegraDB3: TmolRegraDB
          Left = 16
          Top = 16
          Width = 457
          TabStop = True
          inherited Regra: TLabel
            Width = 316
            Caption = 'Regra de Validação de Tipo de Contrato de Empréstimo'
          end
          inherited DBedtRegra: TDBEdit
            Left = 56
            Width = 337
            DataField = 'REGRATIPOCONTR'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 392
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 416
          end
          inherited DBedtIDRegra: TDBEdit
            Width = 49
            DataField = 'IDREGRATIPOCONTR'
            DataSource = ds
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 498
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 17
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 17
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 119
        Width = 17
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 102
        Width = 17
        Enabled = False
        Visible = False
      end
      inherited btnRefresh: TToolbarButton97
        Left = 142
      end
      inherited btnTrazer: TToolbarButton97
        Left = 227
        Width = 17
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 136
      end
    end
  end
  inherited Dock971: TDock97
    Top = 563
    Width = 498
    inherited tb97Fundo: TToolbar97
      Left = 326
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230101
        ClickHelpContext = 230101
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 154
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 384
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMEMPTMO'
      'set'
      '  IDEVENTOJUDICIAL = :IDEVENTOJUDICIAL,'
      '  IDSEGURADORA = :IDSEGURADORA,'
      '  IDGRUPOREGRA = :IDGRUPOREGRA,'
      '  FLGOBRIGAVERBA = :FLGOBRIGAVERBA,'
      '  FLGVERBAUNICA = :FLGVERBAUNICA,'
      '  FLGFORMAPORT = :FLGFORMAPORT,'
      '  CODFORMAPAGTO = :CODFORMAPAGTO,'
      '  PORTFORMARECTO = :PORTFORMARECTO,'
      '  PORTFORMAPAGTO = :PORTFORMAPAGTO,'
      '  FLGFORMAREC = :FLGFORMAREC,'
      '  FLGFORMAPAG = :FLGFORMAPAG,'
      '  FLGDATAATUSLD = :FLGDATAATUSLD,'
      '  FLGSALDODEVANT = :FLGSALDODEVANT,'
      '  FLGPENDCONCESSAO = :FLGPENDCONCESSAO,'
      '  IDTIPOCLIENTE = :IDTIPOCLIENTE,'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDCIDADES = :IDCIDADES,'
      '  IDESTADO = :IDESTADO,'
      '  IDPAIS = :IDPAIS,'
      '  FLGINTEGRACONC = :FLGINTEGRACONC,'
      '  FLGUSAFIARIO = :FLGUSAFIARIO,'
      '  FLGIMPRIMEINSC = :FLGIMPRIMEINSC,'
      '  FLGINTEGRACONTAB = :FLGINTEGRACONTAB,'
      '  FLGINTEGRAFOLHA = :FLGINTEGRAFOLHA,'
      '  FLGINTEGRACAPCAR = :FLGINTEGRACAPCAR,'
      '  TIPODOCPAG = :TIPODOCPAG,'
      '  TIPODOCREC = :TIPODOCREC,'
      '  FLGGERARUBRICA = :FLGGERARUBRICA,'
      '  FLGSUSPENSAOAUTO = :FLGSUSPENSAOAUTO,'
      '  FLGAMTPRESTAB = :FLGAMTPRESTAB,'
      '  FLGRENPRESTAB = :FLGRENPRESTAB,'
      '  FLGCONCULTDIAMES = :FLGCONCULTDIAMES,'
      '  IDITEMIOF = :IDITEMIOF,'
      '  IDITEMIOFCOMPL = :IDITEMIOFCOMPL,'
      '  IDITEMIOFCOMPLCON = :IDITEMIOFCOMPLCON,'
      '  FLGAGRUPAPARC = :FLGAGRUPAPARC,'
      '  FLGAGRUPAPARCFOL = :FLGAGRUPAPARCFOL,'
      '  FLGSUSPENDEATRASO = :FLGSUSPENDEATRASO,'
      '  FLGOBRIGAAVALISTA = :FLGOBRIGAAVALISTA,'
      '  FLGCALCDIA = :FLGCALCDIA,'
      '  FLGMOSTRATIT = :FLGMOSTRATIT,'
      '  FLGTRAVARDATA = :FLGTRAVARDATA,'
      '  FLGTRATAASSINAT = :FLGTRATAASSINAT,'
      '  IDREGRAAVAL = :IDREGRAAVAL,'
      '  FLGENVIODIVERG = :FLGENVIODIVERG,'
      '  FLGPARCDIVERG = :FLGPARCDIVERG,'
      '  FLGTRATQUITCANC = :FLGTRATQUITCANC,'
      '  HORAENCERRA = :HORAENCERRA,'
      '  HORAENCERRADEBITO = :HORAENCERRADEBITO,'
      '  FLGCONTABCONC = :FLGCONTABCONC,'
      '  FLGCONTABPARCELA = :FLGCONTABPARCELA,'
      '  FLGCONTABENCARGO = :FLGCONTABENCARGO,'
      '  FLGINTEGRAENVIO = :FLGINTEGRAENVIO,'
      '  FLGINTEGRAQUITA = :FLGINTEGRAQUITA,'
      '  FLGENVIAQUITA = :FLGENVIAQUITA,'
      '  FLGENVIAAMORTIZA = :FLGENVIAAMORTIZA,'
      '  IDITEMSEGCONC = :IDITEMSEGCONC,'
      '  IDITEMDEVSEGCONC = :IDITEMDEVSEGCONC,'
      '  IDITEMDEVSEGQUIT = :IDITEMDEVSEGQUIT,'
      '  IDITEMSEGCOMPL = :IDITEMSEGCOMPL,'
      '  IDITEMINESPERADO = :IDITEMINESPERADO,'
      '  IDITEMSLDMAIS = :IDITEMSLDMAIS,'
      '  IDITEMSLDMENOS = :IDITEMSLDMENOS,'
      '  FLGEXCEPCIONAL = :FLGEXCEPCIONAL,'
      '  IDREGRADEVSEG = :IDREGRADEVSEG,'
      '  FLGINSCRET = :FLGINSCRET,'
      '  IDREGRAATUALDIA = :IDREGRAATUALDIA,'
      '  FLGCONTROLAINSC = :FLGCONTROLAINSC,'
      '  FLGUSAFLOATCONC = :FLGUSAFLOATCONC,'
      '  FLGQUITAPARCMORTE = :FLGQUITAPARCMORTE,'
      '  FLGPARTIDADOBRADA = :FLGPARTIDADOBRADA,'
      '  IDITEMPROVPERDA = :IDITEMPROVPERDA,'
      '  IDITEMSEGESPECIAL = :IDITEMSEGESPECIAL,'
      '  FLGIMPRINSCRICAO = :FLGIMPRINSCRICAO,'
      '  FLGESTORNOPOSQUIT = :FLGESTORNOPOSQUIT,'
      '  FLGESTORNADIVERG = :FLGESTORNADIVERG,'
      '  FLGABONODIVERG = :FLGABONODIVERG,'
      '  FLGCTABANCOPREF = :FLGCTABANCOPREF,'
      '  IDREGRATIPOCONTR = :IDREGRATIPOCONTR,'
      '  FLGAMORTRETROATIV = :FLGAMORTRETROATIV,'
      '  FLGUSAMARGEMALT   = :FLGUSAMARGEMALT,'
      '  FLGOBRIGAAVALALT  = :FLGOBRIGAAVALALT,'
      '  FLGTRATAATUSLD = :FLGTRATAATUSLD,'
      '  IDREGRAPLANOCOB = :IDREGRAPLANOCOB,'
      '  IDPROVENTO      = :IDPROVENTO,'
      '  IDDOCUMENTO = :IDDOCUMENTO'
      'where'
      '  IDEMPRESAPROP = :OLD_IDEMPRESAPROP'
      '')
    InsertSQL.Strings = (
      'insert into PARAMEMPTMO'
      
        '  (IDEMPRESAPROP,  IDEVENTOJUDICIAL , IDSEGURADORA, IDGRUPOREGRA' +
        ', FLGOBRIGAVERBA,'
      'FLGVERBAUNICA,'
      '   FLGFORMAPORT, CODFORMAPAGTO, PORTFORMARECTO, '
      'PORTFORMAPAGTO, FLGFORMAREC, '
      '   FLGFORMAPAG, FLGDATAATUSLD, FLGSALDODEVANT, '
      'FLGPENDCONCESSAO, IDTIPOCLIENTE, '
      '   IDPROGRAMA, IDEMPRESA, CODCENTROCUSTO, IDCIDADES, IDESTADO, '
      'IDPAIS, '
      
        '   FLGINTEGRACONC, FLGUSAFIARIO, FLGIMPRIMEINSC, FLGINTEGRACONTA' +
        'B, '
      'FLGINTEGRAFOLHA, '
      '   FLGINTEGRACAPCAR, TIPODOCPAG, TIPODOCREC, FLGGERARUBRICA, '
      'FLGSUSPENSAOAUTO, '
      '   FLGAMTPRESTAB, FLGRENPRESTAB, FLGCONCULTDIAMES, IDITEMIOF, '
      'IDITEMIOFCOMPL, '
      '   IDITEMIOFCOMPLCON, FLGAGRUPAPARC, FLGAGRUPAPARCFOL, '
      'FLGSUSPENDEATRASO, '
      '   FLGOBRIGAAVALISTA, FLGCALCDIA, FLGMOSTRATIT, FLGTRAVARDATA, '
      'FLGTRATAASSINAT, '
      '   IDREGRAAVAL, FLGENVIODIVERG, FLGPARCDIVERG, FLGTRATQUITCANC, '
      'HORAENCERRA,HORAENCERRADEBITO, '
      '   FLGCONTABCONC, FLGCONTABPARCELA, FLGCONTABENCARGO, '
      'FLGINTEGRAENVIO, '
      '   FLGINTEGRAQUITA, FLGENVIAQUITA, FLGENVIAAMORTIZA, '
      'IDITEMSEGCONC, IDITEMDEVSEGCONC, '
      '   IDITEMDEVSEGQUIT, IDITEMSEGCOMPL, IDITEMINESPERADO, '
      'IDITEMSLDMAIS, IDITEMSLDMENOS, '
      '   FLGEXCEPCIONAL, IDREGRADEVSEG, FLGINSCRET, IDREGRAATUALDIA, '
      'FLGCONTROLAINSC, '
      '   FLGUSAFLOATCONC, FLGQUITAPARCMORTE, FLGPARTIDADOBRADA, '
      'IDITEMPROVPERDA, '
      '   IDITEMSEGESPECIAL, FLGIMPRINSCRICAO, FLGESTORNOPOSQUIT, '
      'FLGESTORNADIVERG,'
      
        '   FLGABONODIVERG, FLGCTABANCOPREF, IDREGRATIPOCONTR, FLGAMORTRE' +
        'TROATIV,    FLGUSAMARGEMALT,'
      
        '   FLGOBRIGAAVALALT, FLGTRATAATUSLD, IDREGRAPLANOCOB, IDPROVENTO' +
        ', IDDOCUMENTO)'
      'values'
      
        '  (:IDEMPRESAPROP, :IDEVENTOJUDICIAL, :IDSEGURADORA, :IDGRUPOREG' +
        'RA, :FLGOBRIGAVERBA,'
      ':FLGVERBAUNICA,'
      '   :FLGFORMAPORT, :CODFORMAPAGTO, :PORTFORMARECTO,'
      ':PORTFORMAPAGTO, :FLGFORMAREC,'
      '   :FLGFORMAPAG, :FLGDATAATUSLD, :FLGSALDODEVANT,'
      ':FLGPENDCONCESSAO, :IDTIPOCLIENTE,'
      
        '   :IDPROGRAMA, :IDEMPRESA, :CODCENTROCUSTO, :IDCIDADES, :IDESTA' +
        'DO,'
      ':IDPAIS,'
      '   :FLGINTEGRACONC, :FLGUSAFIARIO, :FLGIMPRIMEINSC,'
      ':FLGINTEGRACONTAB,'
      
        '   :FLGINTEGRAFOLHA, :FLGINTEGRACAPCAR, :TIPODOCPAG, :TIPODOCREC' +
        ', '
      ':FLGGERARUBRICA, '
      '   :FLGSUSPENSAOAUTO, :FLGAMTPRESTAB, :FLGRENPRESTAB, '
      ':FLGCONCULTDIAMES, '
      
        '   :IDITEMIOF, :IDITEMIOFCOMPL, :IDITEMIOFCOMPLCON, :FLGAGRUPAPA' +
        'RC, '
      ':FLGAGRUPAPARCFOL, '
      '   :FLGSUSPENDEATRASO, :FLGOBRIGAAVALISTA, :FLGCALCDIA, '
      ':FLGMOSTRATIT, '
      
        '   :FLGTRAVARDATA, :FLGTRATAASSINAT, :IDREGRAAVAL, :FLGENVIODIVE' +
        'RG, '
      ':FLGPARCDIVERG, '
      
        '   :FLGTRATQUITCANC, :HORAENCERRA, :HORAENCERRADEBITO, :FLGCONTA' +
        'BCONC, '
      ':FLGCONTABPARCELA, :FLGCONTABENCARGO, '
      '   :FLGINTEGRAENVIO, :FLGINTEGRAQUITA, :FLGENVIAQUITA, '
      ':FLGENVIAAMORTIZA, '
      '   :IDITEMSEGCONC, :IDITEMDEVSEGCONC, :IDITEMDEVSEGQUIT, '
      ':IDITEMSEGCOMPL, '
      '   :IDITEMINESPERADO, :IDITEMSLDMAIS, :IDITEMSLDMENOS, '
      ':FLGEXCEPCIONAL, '
      
        '   :IDREGRADEVSEG, :FLGINSCRET, :IDREGRAATUALDIA, :FLGCONTROLAIN' +
        'SC, '
      ':FLGUSAFLOATCONC, '
      '   :FLGQUITAPARCMORTE, :FLGPARTIDADOBRADA, :IDITEMPROVPERDA, '
      ':IDITEMSEGESPECIAL,'
      '   :FLGIMPRINSCRICAO, :FLGESTORNOPOSQUIT, :FLGESTORNADIVERG,'
      
        ':FLGABONODIVERG, :FLGCTABANCOPREF, :IDREGRATIPOCONTR, :FLGAMORTR' +
        'ETROATIV, :FLGUSAMARGEMALT,'
      
        '   :FLGOBRIGAAVALALT, :FLGTRATAATUSLD, :IDREGRAPLANOCOB, :IDPROV' +
        'ENTO, :IDDOCUMENTO )'
      ''
      ''
      ''
      ' ')
    DeleteSQL.Strings = (
      'delete from PARAMEMPTMO'
      'where'
      '  IDEMPRESAPROP = :OLD_IDEMPRESAPROP')
    Left = 320
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 952
    Top = 56
  end
  inherited ImlPadrao: TImageList
    Left = 953
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 264
    Top = 0
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   PEP.IDEVENTOJUDICIAL,'
      '   PEP.IDEMPRESAPROP,'
      ''
      '   PEP.IDSEGURADORA,'
      '   PES.NOME AS NOME_SEGURADORA,'
      ''
      '   PEP.IDGRUPOREGRA,'
      '   PEP.FLGOBRIGAVERBA,'
      '   PEP.FLGVERBAUNICA,'
      ''
      '   PEP.FLGFORMAPORT,'
      '   PEP.CODFORMAPAGTO,'
      '   PEP.PORTFORMARECTO,'
      '   PEP.PORTFORMAPAGTO,'
      '   PEP.FLGFORMAREC,'
      '   PEP.FLGFORMAPAG,'
      ''
      '   PEP.FLGDATAATUSLD,'
      '   PEP.FLGSALDODEVANT,'
      '   PEP.FLGPENDCONCESSAO,'
      ''
      '   PEP.IDTIPOCLIENTE,'
      '   PEP.IDPROGRAMA,'
      '   PEP.IDEMPRESA,'
      '   PEP.CODCENTROCUSTO,'
      ''
      '   PEP.IDCIDADES, PEP.IDESTADO, PEP.IDPAIS,'
      ''
      '   PEP.FLGINTEGRACONC,'
      '   PEP.FLGUSAFIARIO,'
      ''
      '   PEP.FLGIMPRIMEINSC,'
      ''
      '   PEP.FLGINTEGRACONTAB,'
      '   PEP.FLGINTEGRAFOLHA,'
      '   PEP.FLGINTEGRACAPCAR,'
      ''
      '   PEP.TIPODOCPAG, PEP.TIPODOCREC,'
      ''
      '   PEP.FLGGERARUBRICA,'
      '   PEP.FLGSUSPENSAOAUTO,'
      '   PEP.FLGAMTPRESTAB,'
      '   PEP.FLGRENPRESTAB,'
      '   PEP.FLGCONCULTDIAMES,'
      ''
      '   PEP.IDITEMIOF,'
      '   PEP.IDITEMIOFCOMPL,'
      '   PEP.IDITEMIOFCOMPLCON,'
      ''
      '   PEP.FLGAGRUPAPARC,'
      '   PEP.FLGAGRUPAPARCFOL,'
      '   PEP.FLGSUSPENDEATRASO,'
      '   PEP.FLGOBRIGAAVALISTA,'
      '   PEP.FLGCALCDIA,'
      '   PEP.FLGMOSTRATIT,'
      '   PEP.FLGTRAVARDATA,'
      '   PEP.FLGTRATAASSINAT,'
      '   PEP.IDREGRAAVAL,'
      ''
      '   PEP.FLGENVIODIVERG,'
      '   PEP.FLGPARCDIVERG,'
      '   PEP.FLGTRATQUITCANC,'
      ''
      '   PEP.HORAENCERRA,'
      ''
      '   PEP.FLGCONTABCONC,'
      '   PEP.FLGCONTABPARCELA,'
      '   PEP.FLGCONTABENCARGO,'
      ''
      '   PEP.FLGINTEGRAENVIO,'
      '   PEP.FLGINTEGRAQUITA,'
      ''
      '   PEP.FLGENVIAQUITA,'
      '   PEP.FLGENVIAAMORTIZA,'
      ''
      '   CID.NOME AS NOME_CIDADE,'
      '   EST.CODESTADO, EST.NOMEESTADO,'
      '   PAI.NOMEPAIS,'
      '   REG.NOMEREGRA,'
      ''
      '   PEP.IDITEMSEGCONC,'
      '   PEP.IDITEMDEVSEGCONC,'
      '   PEP.IDITEMDEVSEGQUIT,'
      '   PEP.IDITEMSEGCOMPL,'
      ''
      '   PEP.IDITEMINESPERADO,'
      '   PEP.IDITEMSLDMAIS,'
      '   PEP.IDITEMSLDMENOS,'
      ''
      '   PEP.FLGEXCEPCIONAL,'
      ''
      '   PEP.IDREGRADEVSEG,'
      '   PEP.FLGINSCRET,'
      '   PEP.IDREGRAATUALDIA,'
      '   DEV.NOMEREGRA AS REGRADEV,'
      '   ATU.NOMEREGRA AS REGRAATU,'
      ''
      '   PEP.FLGCONTROLAINSC,'
      '   PEP.FLGUSAFLOATCONC,'
      ''
      '   PEP.FLGQUITAPARCMORTE,'
      '   PEP.FLGPARTIDADOBRADA,'
      '   PEP.IDITEMPROVPERDA,'
      '   PEP.IDITEMSEGESPECIAL,'
      '   PEP.FLGIMPRINSCRICAO,'
      ''
      '   PEP.FLGESTORNOPOSQUIT,'
      '   PEP.FLGESTORNADIVERG,'
      ''
      '   PEP.FLGABONODIVERG,'
      '   PEP.FLGCTABANCOPREF,'
      ''
      '   PEP.IDREGRATIPOCONTR,'
      '   PEP.FLGAMORTRETROATIV,'
      '   TIP.NOMEREGRA AS REGRATIPOCONTR,'
      '   PEP.FLGUSAMARGEMALT,'
      '   PEP.FLGOBRIGAAVALALT,'
      '   PEP.FLGTRATAATUSLD,'
      ''
      '   PEP.IDREGRAPLANOCOB,'
      '   PLC.NOMEREGRA AS REGRAPLANOCOB,'
      ''
      ' PEP.IDPROVENTO,'
      ' PEP.IDDOCUMENTO,'
      ' TDP.NOMEDOCUMENTO,'
      ' PEP.HORAENCERRADEBITO'
      ''
      'FROM'
      '   PARAMEMPTMO PEP,'
      '   SEGURADORA  SEG,'
      '   PESSOA      PES,'
      '   CIDADES     CID,'
      '   ESTADO      EST,'
      '   PAIS        PAI,'
      '   REGRA       REG,'
      '   REGRA       DEV,'
      '   REGRA       ATU,'
      '   REGRA       TIP,'
      '   REGRA       PLC,'
      '   TIPODOCPESSOA TDP'
      ''
      'WHERE'
      '   PEP.IDEMPRESAPROP   =:PIDEMPRESAPROP'
      '   AND PEP.IDCIDADES       = CID.IDCIDADES(+)'
      '   AND PEP.IDESTADO        = EST.IDESTADO(+)'
      '   AND PEP.IDPAIS          = PAI.IDPAIS(+)'
      '   AND PEP.IDREGRAAVAL     = REG.IDREGRA(+)'
      '   AND PEP.IDREGRADEVSEG   = DEV.IDREGRA(+)'
      '   AND PEP.IDREGRAATUALDIA = ATU.IDREGRA(+)'
      '   AND PEP.IDSEGURADORA    = SEG.IDSEGURADORA(+)'
      '   AND SEG.IDSEGURADORA    = PES.IDPESSOA(+)'
      '   AND PEP.IDREGRATIPOCONTR = TIP.IDREGRA(+)'
      '   AND PEP.IDREGRAPLANOCOB = PLC.IDREGRA(+)'
      '   AND PEP.IDDOCUMENTO = TDP.IDDOCUMENTO(+) '
      ''
      ''
      ' ')
    Left = 352
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
        Value = '1'
      end>
    object qryIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
    end
    object qryIDGRUPOREGRA: TFloatField
      FieldName = 'IDGRUPOREGRA'
    end
    object qryFLGOBRIGAVERBA: TFloatField
      FieldName = 'FLGOBRIGAVERBA'
    end
    object qryFLGFORMAPORT: TStringField
      FieldName = 'FLGFORMAPORT'
      FixedChar = True
      Size = 1
    end
    object qryCODFORMAPAGTO: TFloatField
      FieldName = 'CODFORMAPAGTO'
    end
    object qryPORTFORMARECTO: TFloatField
      FieldName = 'PORTFORMARECTO'
    end
    object qryPORTFORMAPAGTO: TFloatField
      FieldName = 'PORTFORMAPAGTO'
    end
    object qryFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryFLGDATAATUSLD: TFloatField
      FieldName = 'FLGDATAATUSLD'
    end
    object qryIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
    end
    object qryIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
    end
    object qryIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryIDESTADO: TStringField
      FieldName = 'IDESTADO'
      FixedChar = True
      Size = 3
    end
    object qryIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryFLGINTEGRACONC: TFloatField
      FieldName = 'FLGINTEGRACONC'
    end
    object qryFLGIMPRIMEINSC: TFloatField
      FieldName = 'FLGIMPRIMEINSC'
    end
    object qryFLGINTEGRACONTAB: TFloatField
      FieldName = 'FLGINTEGRACONTAB'
    end
    object qryFLGINTEGRAFOLHA: TFloatField
      FieldName = 'FLGINTEGRAFOLHA'
    end
    object qryFLGINTEGRACAPCAR: TFloatField
      FieldName = 'FLGINTEGRACAPCAR'
    end
    object qryNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Size = 50
    end
    object qryCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object qryNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Size = 30
    end
    object qryTIPODOCPAG: TFloatField
      FieldName = 'TIPODOCPAG'
    end
    object qryTIPODOCREC: TFloatField
      FieldName = 'TIPODOCREC'
    end
    object qryFLGGERARUBRICA: TFloatField
      FieldName = 'FLGGERARUBRICA'
    end
    object qryFLGVERBAUNICA: TFloatField
      FieldName = 'FLGVERBAUNICA'
    end
    object qryFLGSUSPENSAOAUTO: TFloatField
      FieldName = 'FLGSUSPENSAOAUTO'
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryFLGSALDODEVANT: TFloatField
      FieldName = 'FLGSALDODEVANT'
    end
    object qryIDITEMIOF: TFloatField
      FieldName = 'IDITEMIOF'
    end
    object qryFLGUSAFIARIO: TFloatField
      FieldName = 'FLGUSAFIARIO'
    end
    object qryIDITEMIOFCOMPL: TFloatField
      FieldName = 'IDITEMIOFCOMPL'
    end
    object qryFLGCONCULTDIAMES: TFloatField
      FieldName = 'FLGCONCULTDIAMES'
    end
    object qryFLGAGRUPAPARC: TFloatField
      FieldName = 'FLGAGRUPAPARC'
    end
    object qryFLGSUSPENDEATRASO: TFloatField
      FieldName = 'FLGSUSPENDEATRASO'
    end
    object qryFLGOBRIGAAVALISTA: TFloatField
      FieldName = 'FLGOBRIGAAVALISTA'
    end
    object qryFLGCALCDIA: TFloatField
      FieldName = 'FLGCALCDIA'
    end
    object qryFLGMOSTRATIT: TFloatField
      FieldName = 'FLGMOSTRATIT'
    end
    object qryFLGTRAVARDATA: TFloatField
      FieldName = 'FLGTRAVARDATA'
    end
    object qryFLGTRATAASSINAT: TFloatField
      FieldName = 'FLGTRATAASSINAT'
    end
    object qryIDREGRAAVAL: TFloatField
      FieldName = 'IDREGRAAVAL'
    end
    object qryNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qryFLGENVIODIVERG: TFloatField
      FieldName = 'FLGENVIODIVERG'
    end
    object qryFLGPARCDIVERG: TFloatField
      FieldName = 'FLGPARCDIVERG'
    end
    object qryFLGTRATQUITCANC: TFloatField
      FieldName = 'FLGTRATQUITCANC'
    end
    object qryHORAENCERRA: TStringField
      FieldName = 'HORAENCERRA'
      EditMask = '!90:00;1;_'
      Size = 5
    end
    object qryFLGPENDCONCESSAO: TFloatField
      FieldName = 'FLGPENDCONCESSAO'
    end
    object qryFLGAMTPRESTAB: TFloatField
      FieldName = 'FLGAMTPRESTAB'
    end
    object qryFLGRENPRESTAB: TFloatField
      FieldName = 'FLGRENPRESTAB'
    end
    object qryFLGCONTABCONC: TFloatField
      FieldName = 'FLGCONTABCONC'
    end
    object qryFLGCONTABPARCELA: TFloatField
      FieldName = 'FLGCONTABPARCELA'
    end
    object qryFLGINTEGRAENVIO: TFloatField
      FieldName = 'FLGINTEGRAENVIO'
    end
    object qryFLGINTEGRAQUITA: TFloatField
      FieldName = 'FLGINTEGRAQUITA'
    end
    object qryIDITEMSEGCONC: TFloatField
      FieldName = 'IDITEMSEGCONC'
    end
    object qryIDITEMDEVSEGCONC: TFloatField
      FieldName = 'IDITEMDEVSEGCONC'
    end
    object qryIDITEMDEVSEGQUIT: TFloatField
      FieldName = 'IDITEMDEVSEGQUIT'
    end
    object qryIDITEMSEGCOMPL: TFloatField
      FieldName = 'IDITEMSEGCOMPL'
    end
    object qryFLGEXCEPCIONAL: TFloatField
      FieldName = 'FLGEXCEPCIONAL'
    end
    object qryIDREGRADEVSEG: TFloatField
      FieldName = 'IDREGRADEVSEG'
    end
    object qryIDREGRAATUALDIA: TFloatField
      FieldName = 'IDREGRAATUALDIA'
    end
    object qryREGRADEV: TStringField
      FieldName = 'REGRADEV'
      Size = 60
    end
    object qryREGRAATU: TStringField
      FieldName = 'REGRAATU'
      Size = 60
    end
    object qryFLGQUITAPARCMORTE: TFloatField
      FieldName = 'FLGQUITAPARCMORTE'
    end
    object qryFLGCONTABENCARGO: TFloatField
      FieldName = 'FLGCONTABENCARGO'
    end
    object qryFLGINSCRET: TFloatField
      FieldName = 'FLGINSCRET'
    end
    object qryFLGCONTROLAINSC: TFloatField
      FieldName = 'FLGCONTROLAINSC'
    end
    object qryFLGUSAFLOATCONC: TFloatField
      FieldName = 'FLGUSAFLOATCONC'
    end
    object qryFLGPARTIDADOBRADA: TFloatField
      FieldName = 'FLGPARTIDADOBRADA'
    end
    object qryIDITEMPROVPERDA: TFloatField
      FieldName = 'IDITEMPROVPERDA'
    end
    object qryIDITEMSEGESPECIAL: TFloatField
      FieldName = 'IDITEMSEGESPECIAL'
    end
    object qryIDITEMIOFCOMPLCON: TFloatField
      FieldName = 'IDITEMIOFCOMPLCON'
    end
    object qryIDITEMINESPERADO: TFloatField
      FieldName = 'IDITEMINESPERADO'
    end
    object qryIDITEMSLDMAIS: TFloatField
      FieldName = 'IDITEMSLDMAIS'
    end
    object qryIDITEMSLDMENOS: TFloatField
      FieldName = 'IDITEMSLDMENOS'
    end
    object qryFLGIMPRINSCRICAO: TFloatField
      FieldName = 'FLGIMPRINSCRICAO'
    end
    object qryFLGAGRUPAPARCFOL: TFloatField
      FieldName = 'FLGAGRUPAPARCFOL'
    end
    object qryFLGESTORNOPOSQUIT: TFloatField
      FieldName = 'FLGESTORNOPOSQUIT'
    end
    object qryIDSEGURADORA: TFloatField
      FieldName = 'IDSEGURADORA'
    end
    object qryNOME_SEGURADORA: TStringField
      FieldName = 'NOME_SEGURADORA'
      Size = 60
    end
    object qryFLGESTORNADIVERG: TFloatField
      FieldName = 'FLGESTORNADIVERG'
    end
    object qryFLGENVIAQUITA: TFloatField
      FieldName = 'FLGENVIAQUITA'
    end
    object qryFLGENVIAAMORTIZA: TFloatField
      FieldName = 'FLGENVIAAMORTIZA'
    end
    object qryFLGABONODIVERG: TFloatField
      FieldName = 'FLGABONODIVERG'
    end
    object qryFLGCTABANCOPREF: TFloatField
      FieldName = 'FLGCTABANCOPREF'
    end
    object qryIDREGRATIPOCONTR: TFloatField
      FieldName = 'IDREGRATIPOCONTR'
    end
    object qryREGRATIPOCONTR: TStringField
      FieldName = 'REGRATIPOCONTR'
    end
    object qryFLGAMORTRETROATIV: TFloatField
      FieldName = 'FLGAMORTRETROATIV'
    end
    object qryFLGUSAMARGEMALT: TFloatField
      FieldName = 'FLGUSAMARGEMALT'
    end
    object qryFLGOBRIGAAVALALT: TFloatField
      FieldName = 'FLGOBRIGAAVALALT'
    end
    object qryFLGTRATAATUSLD: TFloatField
      FieldName = 'FLGTRATAATUSLD'
    end
    object qryIDREGRAPLANOCOB: TFloatField
      FieldName = 'IDREGRAPLANOCOB'
    end
    object qryREGRAPLANOCOB: TStringField
      FieldName = 'REGRAPLANOCOB'
    end
    object qryIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
    object qryIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object qryIDEVENTOJUDICIAL: TFloatField
      FieldName = 'IDEVENTOJUDICIAL'
    end
    object qryHORAENCERRADEBITO: TStringField
      FieldName = 'HORAENCERRADEBITO'
      EditMask = '!90:00;1;_'
      Size = 5
    end
  end
  object qryEvento: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'select * from tipoeventocobemptmo where FLGACORDOJUDICIAL = 1')
    ValidateWithMask = True
    Left = 189
    Top = 65534
  end
  object dsEvento: TwwDataSource
    DataSet = qryEvento
    Left = 224
  end
end
