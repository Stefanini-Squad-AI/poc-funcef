inherited frmCadParamIntegraRec: TfrmCadParamIntegraRec
  Left = 272
  Top = 199
  HelpContext = 150075
  Caption = 'Parâmetros para Integração [Itens]'
  ClientHeight = 367
  ClientWidth = 684
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 684
    Height = 299
    object Label2: TLabel
      Left = 16
      Top = 19
      Width = 62
      Height = 13
      Caption = 'Descrição:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 504
      Top = 19
      Width = 57
      Height = 13
      Caption = '(opcional)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBedtDescricao: TDBEdit
      Left = 81
      Top = 16
      Width = 419
      Height = 21
      DataField = 'DESCPARAMINTEGRA'
      DataSource = ds
      TabOrder = 0
    end
    object pgcParametros: TPageControl
      Left = 1
      Top = 52
      Width = 682
      Height = 246
      ActivePage = tbsFolhaR
      Align = alBottom
      TabOrder = 1
      object tbsFiltro: TTabSheet
        Caption = 'Filtro / Escopo'
        object Label7: TLabel
          Left = 152
          Top = 10
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label6: TLabel
          Left = 152
          Top = 170
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label8: TLabel
          Left = 152
          Top = 130
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
        end
        object Label9: TLabel
          Left = 152
          Top = 50
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label19: TLabel
          Left = 152
          Top = 90
          Width = 111
          Height = 13
          Caption = 'Item de Empréstimo'
        end
        object DBcboPatro: TwwDBLookupCombo
          Left = 152
          Top = 184
          Width = 385
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'48'#9#9'F')
          DataField = 'IDPATRO'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookPatro
          LookupField = 'IDPESSOA'
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
        object DBcboPlanPrev: TwwDBLookupCombo
          Left = 152
          Top = 144
          Width = 385
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'48'#9#9'F')
          DataField = 'IDPLANOPREV'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookPlanPrev
          LookupField = 'IDPLANOPREV'
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 152
          Top = 24
          Width = 385
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TCEDESCRICAO'#9'38'#9'Contrato'#9'F'
            'DESCTIPOEMPTMO'#9'30'#9'Empréstimo'#9'F')
          DataField = 'IDTIPOCONTREMPTMO'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookTipoContr
          LookupField = 'IDTipoContrEmptmo'
          Options = [loTitles]
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = DBcboTipoContratoCloseUp
        end
        object DBcboItemEmptmo: TwwDBLookupCombo
          Left = 152
          Top = 104
          Width = 385
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ITEDESCRICAO'#9'40'#9'ITEDESCRICAO'#9'F')
          DataField = 'IDITEMEMPTMO'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookItemIntegra
          LookupField = 'IDITEMEMPTMO'
          DropDownWidth = 8
          Enabled = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnCloseUp = DBcboItemEmptmoCloseUp
        end
        object DBedtTipoEmpto: TDBEdit
          Left = 152
          Top = 64
          Width = 384
          Height = 21
          Color = clBtnFace
          DataField = 'DESCTIPOEMPTMO'
          DataSource = ds
          Enabled = False
          TabOrder = 4
        end
      end
      object tbsGeral: TTabSheet
        Caption = 'Geral'
        ImageIndex = 2
        object Label15: TLabel
          Left = 152
          Top = 154
          Width = 101
          Height = 13
          Caption = 'Entidade Contábil'
          Visible = False
        end
        object Label16: TLabel
          Left = 152
          Top = 26
          Width = 108
          Height = 13
          Caption = 'Atividade / Projeto'
        end
        object Label26: TLabel
          Left = 152
          Top = 90
          Width = 160
          Height = 13
          Caption = 'Centro de Responsabilidade'
        end
        object DBcboTipoRecebDesemb: TwwDBLookupCombo
          Left = 152
          Top = 168
          Width = 385
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'48'#9#9'F')
          DataField = 'IDPLANOPREVCONTAB'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookPlanPrevContab
          LookupField = 'IDPLANOPREV'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          Visible = False
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBcboUnidNegocio: TwwDBLookupCombo
          Left = 152
          Top = 40
          Width = 385
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'48'#9#9'F')
          DataField = 'UNIDNEGOC'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookUnidNegocio
          LookupField = 'UNIDNEGOC'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBcboCentroRespon: TwwDBLookupCombo
          Left = 152
          Top = 104
          Width = 385
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'48'#9#9'F')
          DataField = 'CODCENTRORESPON'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookCentroRespon
          LookupField = 'CODCENTRORESPON'
          Style = csDropDownList
          DropDownCount = 6
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object tbsCAPCAR: TTabSheet
        Caption = 'Apropriação'
        ImageIndex = 1
        object Label4: TLabel
          Left = 16
          Top = 162
          Width = 204
          Height = 13
          Caption = 'Tipo de Recebimento / Desembolso'
        end
        object GrpCCDebFinan: TGroupBox
          Left = 16
          Top = 8
          Width = 313
          Height = 145
          Caption = ' Conta Contábil para Débito '
          TabOrder = 0
          object Label18: TLabel
            Left = 16
            Top = 98
            Width = 55
            Height = 13
            Caption = 'Subconta'
          end
          object Label20: TLabel
            Left = 16
            Top = 58
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object lblCCDebFinan: TLabel
            Left = 16
            Top = 18
            Width = 40
            Height = 13
            Caption = 'Código'
          end
          object btnBuscaContaDebFinan: TBitBtn
            Left = 192
            Top = 32
            Width = 24
            Height = 22
            Hint = 'Busca uma Conta Contábil'
            TabOrder = 1
            OnClick = btnBuscaContaDebFinanClick
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
          object DBcboCCustDebFinan: TwwDBLookupCombo
            Left = 16
            Top = 72
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            DataField = 'CCUSTDEBFINAN'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookCCDebFinan
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object DBedtCodDebFinan: TDBEdit
            Left = 16
            Top = 32
            Width = 177
            Height = 21
            DataField = 'CCDEBFINAN'
            DataSource = ds
            TabOrder = 0
            OnExit = DBedtCodDebFinanExit
          end
          object DBcboSubDebFinan: TwwDBLookupCombo
            Left = 16
            Top = 112
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
            DataField = 'SUBCDEBFINAN'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookSubDebFinan
            LookupField = 'CODSUBCONTA'
            DropDownWidth = 8
            Enabled = False
            TabOrder = 3
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
        end
        object GrpCCCredFinan: TGroupBox
          Left = 344
          Top = 8
          Width = 313
          Height = 145
          Caption = ' Conta Contábil para Crédito '
          TabOrder = 1
          object Label22: TLabel
            Left = 16
            Top = 16
            Width = 39
            Height = 13
            Caption = 'Label2'
          end
          object Label23: TLabel
            Left = 16
            Top = 98
            Width = 55
            Height = 13
            Caption = 'Subconta'
          end
          object Label24: TLabel
            Left = 16
            Top = 58
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object lblCCredFinan: TLabel
            Left = 16
            Top = 18
            Width = 40
            Height = 13
            Caption = 'Código'
          end
          object btnBuscaContaCredFinan: TBitBtn
            Left = 192
            Top = 32
            Width = 24
            Height = 22
            Hint = 'Busca uma Conta Contábil'
            TabOrder = 1
            OnClick = btnBuscaContaDebFinanClick
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
          object DBcboCCustCredFinan: TwwDBLookupCombo
            Left = 16
            Top = 72
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            DataField = 'CCUSTCREDFINAN'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookCCredFinan
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object DBedtCodCredFinan: TDBEdit
            Left = 16
            Top = 32
            Width = 177
            Height = 21
            DataField = 'CCCREDFINAN'
            DataSource = ds
            TabOrder = 0
            OnExit = DBedtCodDebFinanExit
          end
          object DBcboSubCredFinan: TwwDBLookupCombo
            Left = 16
            Top = 112
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
            DataField = 'SUBCCREDFINAN'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookSbCredFinan
            LookupField = 'CODSUBCONTA'
            DropDownWidth = 8
            Enabled = False
            TabOrder = 3
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
        end
        object DBcboTipoRecDesFinan: TwwDBLookupCombo
          Left = 16
          Top = 176
          Width = 385
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'30'#9'DESCRICAO'#9'F')
          DataField = 'TIPORECDESFINAN'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookTipoRecebDesemb
          LookupField = 'CODTIPRECDES'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object tbsFolha: TTabSheet
        Caption = 'Envio / Recebimento'
        ImageIndex = 2
        object Label5: TLabel
          Left = 16
          Top = 162
          Width = 176
          Height = 13
          Caption = 'Tipo de Desembolso (p/ Folha)'
        end
        object DBcboTipoDesembFolha: TwwDBLookupCombo
          Left = 16
          Top = 176
          Width = 385
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'30'#9'DESCRICAO'#9'F')
          DataField = 'TIPORECDESFOLHA'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookTipoDesemb
          LookupField = 'CODTIPRECDES'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object grpDebFolha: TGroupBox
          Left = 16
          Top = 8
          Width = 313
          Height = 145
          Caption = ' Conta Contábil para Débito '
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 98
            Width = 55
            Height = 13
            Caption = 'Subconta'
          end
          object Label10: TLabel
            Left = 16
            Top = 58
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object lblCCDebFolha: TLabel
            Left = 16
            Top = 18
            Width = 40
            Height = 13
            Caption = 'Código'
          end
          object btnBuscaContaDebFolha: TBitBtn
            Left = 192
            Top = 32
            Width = 24
            Height = 22
            Hint = 'Busca uma Conta Contábil'
            TabOrder = 1
            OnClick = btnBuscaContaDebFinanClick
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
          object DBcboCCustDebFolha: TwwDBLookupCombo
            Left = 16
            Top = 72
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            DataField = 'CCUSTDEBFOLHA'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookCCDebFolha
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object DBedtCodDebFolha: TDBEdit
            Left = 16
            Top = 32
            Width = 177
            Height = 21
            DataField = 'CCDEBFOLHA'
            DataSource = ds
            TabOrder = 0
            OnExit = DBedtCodDebFinanExit
          end
          object DBcboSubDebFolha: TwwDBLookupCombo
            Left = 16
            Top = 112
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
            DataField = 'SUBCDEBFOLHA'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookSubDebFolha
            LookupField = 'CODSUBCONTA'
            DropDownWidth = 8
            Enabled = False
            TabOrder = 3
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
        end
        object grpCredFolha: TGroupBox
          Left = 344
          Top = 8
          Width = 313
          Height = 145
          Caption = ' Conta Contábil para Crédito '
          TabOrder = 1
          object Label12: TLabel
            Left = 16
            Top = 16
            Width = 39
            Height = 13
            Caption = 'Label2'
          end
          object Label13: TLabel
            Left = 16
            Top = 98
            Width = 55
            Height = 13
            Caption = 'Subconta'
          end
          object Label14: TLabel
            Left = 16
            Top = 58
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object lblCCredFolha: TLabel
            Left = 16
            Top = 18
            Width = 40
            Height = 13
            Caption = 'Código'
          end
          object btnBuscaContaCredFolha: TBitBtn
            Left = 192
            Top = 32
            Width = 24
            Height = 22
            Hint = 'Busca uma Conta Contábil'
            TabOrder = 1
            OnClick = btnBuscaContaDebFinanClick
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
          object DBcboCCustCredFolha: TwwDBLookupCombo
            Left = 16
            Top = 72
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            DataField = 'CCUSTCREDFOLHA'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookCCredFolha
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object DBedtCodCredFolha: TDBEdit
            Left = 16
            Top = 32
            Width = 177
            Height = 21
            DataField = 'CCCREDFOLHA'
            DataSource = ds
            TabOrder = 0
            OnExit = DBedtCodDebFinanExit
          end
          object DBcboSubCredFolha: TwwDBLookupCombo
            Left = 16
            Top = 112
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA'#9'F')
            DataField = 'SUBCCREDFOLHA'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookSbCredFolha
            LookupField = 'CODSUBCONTA'
            DropDownWidth = 8
            Enabled = False
            TabOrder = 3
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
        end
      end
      object tbsFolhaR: TTabSheet
        Caption = 'Envio / Recebimento em Resultado '
        ImageIndex = 4
        object Label30: TLabel
          Left = 16
          Top = 162
          Width = 176
          Height = 13
          Caption = 'Tipo de Desembolso (p/ Folha)'
        end
        object grpDebFolhaR: TGroupBox
          Left = 16
          Top = 8
          Width = 313
          Height = 145
          Caption = ' Conta Contábil para Débito '
          TabOrder = 0
          object Label11: TLabel
            Left = 16
            Top = 98
            Width = 55
            Height = 13
            Caption = 'Subconta'
          end
          object Label17: TLabel
            Left = 16
            Top = 58
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object lblCCDebFolhaR: TLabel
            Left = 16
            Top = 18
            Width = 40
            Height = 13
            Caption = 'Código'
          end
          object btnBuscaContaDebFolhaR: TBitBtn
            Left = 192
            Top = 32
            Width = 24
            Height = 22
            Hint = 'Busca uma Conta Contábil'
            TabOrder = 1
            OnClick = btnBuscaContaDebFolhaRClick
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
          object DBcboCCustDebFolhaR: TwwDBLookupCombo
            Left = 16
            Top = 72
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            DataField = 'CCUSTDEBFOLHARESULT'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookCCDebFolha
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object DBedtCodDebFolhaR: TDBEdit
            Left = 16
            Top = 32
            Width = 177
            Height = 21
            DataField = 'CCDEBFOLHARESULT'
            DataSource = ds
            TabOrder = 0
            OnExit = DBedtCodDebFolhaRExit
          end
          object DBcboSubDebFolhaR: TwwDBLookupCombo
            Left = 16
            Top = 112
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
            DataField = 'SUBCDEBFOLHARESULT'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookSubDebFolha
            LookupField = 'CODSUBCONTA'
            DropDownWidth = 8
            Enabled = False
            TabOrder = 3
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
        end
        object grpCredFolhaR: TGroupBox
          Left = 344
          Top = 8
          Width = 313
          Height = 145
          Caption = ' Conta Contábil para Crédito '
          TabOrder = 1
          object Label25: TLabel
            Left = 16
            Top = 16
            Width = 39
            Height = 13
            Caption = 'Label2'
          end
          object Label27: TLabel
            Left = 16
            Top = 98
            Width = 55
            Height = 13
            Caption = 'Subconta'
          end
          object Label28: TLabel
            Left = 16
            Top = 58
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object lblCCredFolhaR: TLabel
            Left = 16
            Top = 18
            Width = 40
            Height = 13
            Caption = 'Código'
          end
          object btnBuscaContaCredFolhaR: TBitBtn
            Left = 192
            Top = 32
            Width = 24
            Height = 22
            Hint = 'Busca uma Conta Contábil'
            TabOrder = 1
            OnClick = btnBuscaContaCredFolhaRClick
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
          object DBcboCCustCredFolhaR: TwwDBLookupCombo
            Left = 16
            Top = 72
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            DataField = 'CCUSTCREDFOLHARESULT'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookCCredFolha
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object DBedtCodCredFolhaR: TDBEdit
            Left = 16
            Top = 32
            Width = 177
            Height = 21
            DataField = 'CCCREDFOLHARESULT'
            DataSource = ds
            TabOrder = 0
            OnExit = DBedtCodCredFolhaRExit
          end
          object DBcboSubCredFolhaR: TwwDBLookupCombo
            Left = 16
            Top = 112
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA'#9'F')
            DataField = 'SUBCCREDFOLHARESULT'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookSbCredFolha
            LookupField = 'CODSUBCONTA'
            DropDownWidth = 8
            Enabled = False
            TabOrder = 3
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
        end
        object DBcboTipoDesembFolhaR: TwwDBLookupCombo
          Left = 16
          Top = 176
          Width = 385
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'30'#9'DESCRICAO'#9'F')
          DataField = 'TIPORECDESFOLHARESULT'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookTipoDesemb
          LookupField = 'CODTIPRECDES'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 684
    inherited Toolbar971: TToolbar97
      inherited btnRefresh: TToolbarButton97
        Visible = False
      end
      inherited ToolbarSep972: TToolbarSep97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 334
    Width = 684
    inherited tb97Fundo: TToolbar97
      Left = 512
      DockPos = 520
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150056
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 340
      DockPos = 348
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
    Left = 592
    Top = 67
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMINTEGRAEP'
      'set'
      '  DESCPARAMINTEGRA = :DESCPARAMINTEGRA,'
      '  RECPAG = :RECPAG,'
      '  IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO,'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  PLANO = :PLANO,'
      '  CCDEBFOLHA = :CCDEBFOLHA,'
      '  CCUSTDEBFOLHA = :CCUSTDEBFOLHA,'
      '  SUBCDEBFOLHA = :SUBCDEBFOLHA,'
      '  CCCREDFOLHA = :CCCREDFOLHA,'
      '  CCUSTCREDFOLHA = :CCUSTCREDFOLHA,'
      '  SUBCCREDFOLHA = :SUBCCREDFOLHA,'
      '  CCDEBFINAN = :CCDEBFINAN,'
      '  CCUSTDEBFINAN = :CCUSTDEBFINAN,'
      '  SUBCDEBFINAN = :SUBCDEBFINAN,'
      '  CCCREDFINAN = :CCCREDFINAN,'
      '  CCUSTCREDFINAN = :CCUSTCREDFINAN,'
      '  SUBCCREDFINAN = :SUBCCREDFINAN,'
      '  RECPAGFINAN = :RECPAGFINAN,'
      '  TIPORECDESFINAN = :TIPORECDESFINAN,'
      '  RECPAGFOLHA = :RECPAGFOLHA,'
      '  TIPORECDESFOLHA = :TIPORECDESFOLHA,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPATRO = :IDPATRO,'
      '  IDPLANOPREVCONTAB = :IDPLANOPREVCONTAB,'
      '  IDTIPOEMPTMO = :IDTIPOEMPTMO,'
      '  CCDEBFOLHARESULT = :CCDEBFOLHARESULT,'
      '  CCCREDFOLHARESULT = :CCCREDFOLHARESULT,'
      '  CCUSTDEBFOLHARESULT = :CCUSTDEBFOLHARESULT,'
      '  CCUSTCREDFOLHARESULT = :CCUSTCREDFOLHARESULT,'
      '  SUBCDEBFOLHARESULT = :SUBCDEBFOLHARESULT,'
      '  SUBCCREDFOLHARESULT = :SUBCCREDFOLHARESULT,'
      '  TIPORECDESFOLHARESULT = :TIPORECDESFOLHARESULT '
      ''
      'where'
      '  IDPARAMINTEGRAEP = :OLD_IDPARAMINTEGRAEP')
    InsertSQL.Strings = (
      'insert into PARAMINTEGRAEP'
      '  (IDPARAMINTEGRAEP, DESCPARAMINTEGRA, RECPAG, '
      'IDTIPOCONTREMPTMO, IDITEMEMPTMO, IDPESSOA, IDEMPRESA, '
      'PLANO, CCDEBFOLHA, CCUSTDEBFOLHA, SUBCDEBFOLHA, CCCREDFOLHA, '
      'CCUSTCREDFOLHA, SUBCCREDFOLHA, CCDEBFINAN, CCUSTDEBFINAN, '
      
        'SUBCDEBFINAN, CCCREDFINAN, CCUSTCREDFINAN, SUBCCREDFINAN, RECPAG' +
        'FINAN, '
      
        'TIPORECDESFINAN, RECPAGFOLHA, TIPORECDESFOLHA, UNIDNEGOC, CODCEN' +
        'TRORESPON, '
      
        'IDPLANOPREV, IDPATRO, IDPLANOPREVCONTAB, IDTIPOEMPTMO,CCDEBFOLHA' +
        'RESULT,'
      
        'CCCREDFOLHARESULT,CCUSTDEBFOLHARESULT,CCUSTCREDFOLHARESULT,SUBCD' +
        'EBFOLHARESULT,'
      'SUBCCREDFOLHARESULT,TIPORECDESFOLHARESULT)'
      'values'
      '  (:IDPARAMINTEGRAEP, :DESCPARAMINTEGRA, :RECPAG, '
      ':IDTIPOCONTREMPTMO, :IDITEMEMPTMO, '
      '   :IDPESSOA, :IDEMPRESA, :PLANO, :CCDEBFOLHA, :CCUSTDEBFOLHA, '
      ':SUBCDEBFOLHA, '
      '   :CCCREDFOLHA, :CCUSTCREDFOLHA, :SUBCCREDFOLHA, :CCDEBFINAN, '
      ':CCUSTDEBFINAN, '
      
        '   :SUBCDEBFINAN, :CCCREDFINAN, :CCUSTCREDFINAN, :SUBCCREDFINAN,' +
        ' '
      ':RECPAGFINAN, '
      
        '   :TIPORECDESFINAN, :RECPAGFOLHA, :TIPORECDESFOLHA, :UNIDNEGOC,' +
        ' '
      ':CODCENTRORESPON, '
      '   :IDPLANOPREV, :IDPATRO, :IDPLANOPREVCONTAB, :IDTIPOEMPTMO, '
      ':CCDEBFOLHARESULT, :CCCREDFOLHARESULT, :CCUSTDEBFOLHARESULT,'
      
        '   :CCUSTCREDFOLHARESULT, :SUBCDEBFOLHARESULT, :SUBCCREDFOLHARES' +
        'ULT, '
      ':TIPORECDESFOLHARESULT)')
    DeleteSQL.Strings = (
      'delete from PARAMINTEGRAEP'
      'where'
      '  IDPARAMINTEGRAEP = :OLD_IDPARAMINTEGRAEP')
    Left = 652
    Top = 19
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'TC.TCEDESCRICAO'
      'ITC.ITCEVENTO'
      
        'DECODE(ITC.ITCEVENTO, 0, '#39'Concessão/Renovação'#39', 1, '#39'Prestação'#39', ' +
        '2, '#39'Amortização/Refinanciamento'#39', 3, '#39'Quitação'#39', 4, '#39'Atualização' +
        ' de Débitos'#39', 5, '#39'Atualização Diária'#39')'
      'DECODE(ITC.FLGCENTRALIZA, 1, '#39'X'#39', NULL)'
      'DECODE(ITC.FLGDESTACADO, 1, '#39'X'#39', NULL)'
      'ITE.IDITEMEMPTMO'
      'ITE.ITEDESCRICAO'
      'PP.NOME'
      'PL.NOME'
      'PI.DESCPARAMINTEGRA')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Tipo de Contrato'
      'Nº Evento'
      'Evento'
      'Centraliza'
      'Destacado'
      'Nº Item'
      'Item'
      'Patrocinadora'
      'Plano Previdencial'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PP'
      'PARAMINTEGRAEP PI'
      'ITEMXTIPOCONTR ITC'
      'ITEMEMPTMO ITE'
      'TIPOCONTREMPTMO TC'
      'TIPOEMPTMO TE'
      'PATRO PA'
      'PLANPREV PL')
    CamposChave.Strings = (
      'PI.IDPARAMINTEGRAEP'
      'PI.IDTIPOCONTREMPTMO'
      'PI.RECPAG')
    Filtro.Strings = (
      'PI.IDPATRO = PA.IDPESSOA(+)'
      'PA.IDPESSOA = PP.IDPESSOA(+)'
      'PI.IDPLANOPREV = PL.IDPLANOPREV(+)'
      'PI.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO'
      'PI.IDITEMEMPTMO = ITC.IDITEMEMPTMO'
      'ITC.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO'
      'ITC.IDITEMEMPTMO = ITE.IDITEMEMPTMO'
      'TC.IDTIPOEMPTMO  = TE.IDTIPOEMPTMO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '3'
      '15'
      '3'
      '3'
      '3'
      '25'
      '35'
      '40'
      '60')
    Left = 544
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 969
    Top = 54
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 524
    Top = 200
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   PI.IDPARAMINTEGRAEP, '
      '   PI.DESCPARAMINTEGRA,'
      '   PI.RECPAG, '
      '   PI.IDTIPOCONTREMPTMO, '
      '   PI.IDITEMEMPTMO,'
      ''
      '   PI.IDPESSOA, '
      '   PI.IDEMPRESA, '
      '   PI.PLANO,'
      ''
      '   PI.CCDEBFOLHA, '
      '   PI.CCUSTDEBFOLHA, '
      '   PI.SUBCDEBFOLHA,'
      '   PI.CCCREDFOLHA, '
      '   PI.CCUSTCREDFOLHA, '
      '   PI.SUBCCREDFOLHA,'
      '   PI.CCDEBFINAN, '
      '   PI.CCUSTDEBFINAN, '
      '   PI.SUBCDEBFINAN,'
      '   PI.CCCREDFINAN, '
      '   PI.CCUSTCREDFINAN, '
      '   PI.SUBCCREDFINAN,'
      ''
      '   PI.RECPAGFINAN, '
      '   PI.TIPORECDESFINAN,'
      '   PI.RECPAGFOLHA, '
      '   PI.TIPORECDESFOLHA,'
      ''
      '   PI.CCDEBFOLHARESULT,'
      '   PI.CCCREDFOLHARESULT,'
      '   PI.CCUSTDEBFOLHARESULT,'
      '   PI.CCUSTCREDFOLHARESULT,'
      '   PI.SUBCDEBFOLHARESULT,'
      '   PI.SUBCCREDFOLHARESULT,  '
      '   PI.TIPORECDESFOLHARESULT,'
      '   PI.UNIDNEGOC, '
      '   PI.CODCENTRORESPON,'
      ''
      '   PI.IDPLANOPREV, '
      '   PI.IDPATRO,  '
      '   PI.IDPLANOPREVCONTAB,'
      ''
      '   TC.IDTIPOEMPTMO, '
      '   TE.DESCTIPOEMPTMO'
      ''
      'FROM'
      '   PARAMINTEGRAEP PI, '
      '   TIPOCONTREMPTMO TC, '
      '   TIPOEMPTMO TE'
      ''
      'WHERE'
      '   ( PI.IDPARAMINTEGRAEP = :PIDPARAMINTEGRAEP )'
      '   AND ( PI.IDPESSOA = :PIDPESSOA )'
      '   AND ( TE.IDEMPRESAPROP = :PIDEMPRESAPROP )'
      '   AND ( PI.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO = TE.IDTIPOEMPTMO )'
      ' '
      ' ')
    Left = 624
    Top = 63
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPARAMINTEGRAEP'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
        Value = '1'
      end>
    object qryIDPARAMINTEGRAEP: TFloatField
      FieldName = 'IDPARAMINTEGRAEP'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDPARAMINTEGRAEP'
    end
    object qryDESCPARAMINTEGRA: TStringField
      FieldName = 'DESCPARAMINTEGRA'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.DESCPARAMINTEGRA'
      Size = 60
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDTIPOCONTREMPTMO'
    end
    object qryIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDITEMEMPTMO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDPESSOA'
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDEMPRESA'
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.PLANO'
    end
    object qryCCDEBFOLHA: TStringField
      FieldName = 'CCDEBFOLHA'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCDEBFOLHA'
      FixedChar = True
      Size = 18
    end
    object qryCCUSTDEBFOLHA: TStringField
      FieldName = 'CCUSTDEBFOLHA'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCUSTDEBFOLHA'
      FixedChar = True
      Size = 10
    end
    object qrySUBCDEBFOLHA: TFloatField
      FieldName = 'SUBCDEBFOLHA'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.SUBCDEBFOLHA'
    end
    object qryCCCREDFOLHA: TStringField
      FieldName = 'CCCREDFOLHA'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCCREDFOLHA'
      FixedChar = True
      Size = 18
    end
    object qryCCUSTCREDFOLHA: TStringField
      FieldName = 'CCUSTCREDFOLHA'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCUSTCREDFOLHA'
      FixedChar = True
      Size = 10
    end
    object qrySUBCCREDFOLHA: TFloatField
      FieldName = 'SUBCCREDFOLHA'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.SUBCCREDFOLHA'
    end
    object qryCCDEBFINAN: TStringField
      FieldName = 'CCDEBFINAN'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCDEBFINAN'
      FixedChar = True
      Size = 18
    end
    object qryCCUSTDEBFINAN: TStringField
      FieldName = 'CCUSTDEBFINAN'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCUSTDEBFINAN'
      FixedChar = True
      Size = 10
    end
    object qrySUBCDEBFINAN: TFloatField
      FieldName = 'SUBCDEBFINAN'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.SUBCDEBFINAN'
    end
    object qryCCCREDFINAN: TStringField
      FieldName = 'CCCREDFINAN'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCCREDFINAN'
      FixedChar = True
      Size = 18
    end
    object qryCCUSTCREDFINAN: TStringField
      FieldName = 'CCUSTCREDFINAN'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCUSTCREDFINAN'
      FixedChar = True
      Size = 10
    end
    object qrySUBCCREDFINAN: TFloatField
      FieldName = 'SUBCCREDFINAN'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.SUBCCREDFINAN'
    end
    object qryRECPAGFINAN: TStringField
      FieldName = 'RECPAGFINAN'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.RECPAGFINAN'
      FixedChar = True
      Size = 1
    end
    object qryTIPORECDESFINAN: TStringField
      FieldName = 'TIPORECDESFINAN'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.TIPORECDESFINAN'
      FixedChar = True
      Size = 15
    end
    object qryRECPAGFOLHA: TStringField
      FieldName = 'RECPAGFOLHA'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.RECPAGFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryTIPORECDESFOLHA: TStringField
      FieldName = 'TIPORECDESFOLHA'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.TIPORECDESFOLHA'
      FixedChar = True
      Size = 15
    end
    object qryUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.UNIDNEGOC'
    end
    object qryCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDPLANOPREV'
    end
    object qryIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDPATRO'
    end
    object qryIDPLANOPREVCONTAB: TFloatField
      FieldName = 'IDPLANOPREVCONTAB'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDPLANOPREVCONTAB'
    end
    object qryIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOEMPTMO'
    end
    object qryDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Size = 60
    end
    object qryCCDEBFOLHARESULT: TStringField
      FieldName = 'CCDEBFOLHARESULT'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCDEBFOLHARESULT'
      FixedChar = True
      Size = 18
    end
    object qryCCCREDFOLHARESULT: TStringField
      FieldName = 'CCCREDFOLHARESULT'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCCREDFOLHARESULT'
      FixedChar = True
      Size = 18
    end
    object qryCCUSTDEBFOLHARESULT: TStringField
      FieldName = 'CCUSTDEBFOLHARESULT'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCUSTDEBFOLHARESULT'
      FixedChar = True
      Size = 10
    end
    object qryCCUSTCREDFOLHARESULT: TStringField
      FieldName = 'CCUSTCREDFOLHARESULT'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCUSTCREDFOLHARESULT'
      FixedChar = True
      Size = 10
    end
    object qrySUBCDEBFOLHARESULT: TFloatField
      FieldName = 'SUBCDEBFOLHARESULT'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.SUBCDEBFOLHARESULT'
    end
    object qrySUBCCREDFOLHARESULT: TFloatField
      FieldName = 'SUBCCREDFOLHARESULT'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.SUBCCREDFOLHARESULT'
    end
    object qryTIPORECDESFOLHARESULT: TStringField
      FieldName = 'TIPORECDESFOLHARESULT'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.TIPORECDESFOLHARESULT'
      FixedChar = True
      Size = 15
    end
  end
end
