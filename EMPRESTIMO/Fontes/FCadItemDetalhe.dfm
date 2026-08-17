inherited frmCadItemDetalhe: TfrmCadItemDetalhe
  Left = 323
  Top = 71
  BorderStyle = bsDialog
  Caption = 'Detalhes'
  ClientHeight = 577
  ClientWidth = 756
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 756
    Height = 544
    object pnlRegras: TPanel
      Left = 0
      Top = 0
      Width = 756
      Height = 544
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Bevel2: TBevel
        Left = 16
        Top = 34
        Width = 720
        Height = 3
        Shape = bsBottomLine
      end
      object lblNomeItem: TfcLabel
        Left = 16
        Top = 8
        Width = 139
        Height = 24
        Caption = 'Nome do Item'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object lbGrupo: TLabel
        Left = 618
        Top = 85
        Width = 108
        Height = 13
        Caption = 'Tratamento quanto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 288
        Top = 48
        Width = 2
        Height = 247
        Shape = bsLeftLine
      end
      object Label15: TLabel
        Left = 568
        Top = 283
        Width = 94
        Height = 13
        Caption = 'de perda efetiva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object grpRubricas: TGroupBox
        Left = 16
        Top = 296
        Width = 521
        Height = 240
        Caption = ' Rubricas '
        TabOrder = 13
        object Label1: TLabel
          Left = 35
          Top = 25
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Normal: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 38
          Top = 69
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Atraso: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 13
          Top = 115
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = 'Devolução: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 12
          Top = 151
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Informativa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 12
          Top = 198
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Informativa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 14
          Top = 212
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Folha Pgto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 7
          Top = 165
          Width = 73
          Height = 13
          Alignment = taRightJustify
          Caption = 'Folha Benef:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBcboRubNormal: TwwDBLookupCombo
          Left = 179
          Top = 21
          Width = 310
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'1'#9'Descrição'#9'F')
          LookupTable = dtmLookEmptmo.qryLookRubricaNormal
          LookupField = 'IDPROVENTO'
          DropDownCount = 4
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnChange = DBcboRubNormalChange
        end
        object DBcboRubAtraso: TwwDBLookupCombo
          Left = 179
          Top = 65
          Width = 310
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'1'#9'Descrição'#9'F')
          LookupTable = dtmLookEmptmo.qryLookRubricaAtraso
          LookupField = 'IDPROVENTO'
          DropDownCount = 4
          ParentFont = False
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnChange = DBcboRubAtrasoChange
        end
        object DBcboRubDevolucao: TwwDBLookupCombo
          Left = 179
          Top = 111
          Width = 310
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'1'#9'Descrição'#9'F')
          LookupTable = dtmLookEmptmo.qryLookRubricaDevol
          LookupField = 'IDPROVENTO'
          DropDownCount = 4
          ParentFont = False
          TabOrder = 10
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnChange = DBcboRubDevolucaoChange
        end
        object DBcboRubInformativa: TwwDBLookupCombo
          Left = 179
          Top = 156
          Width = 310
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'1'#9'Descrição'#9'F')
          LookupTable = dtmLookEmptmo.qryLookRubricaInfEmprestimo
          LookupField = 'IDPROVENTO'
          DropDownCount = 4
          Enabled = False
          ParentFont = False
          TabOrder = 14
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnChange = DBcboRubInformativaChange
        end
        object edtRubNormal: TEdit
          Left = 84
          Top = 21
          Width = 45
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object edtRubAtraso: TEdit
          Left = 84
          Top = 65
          Width = 45
          Height = 21
          Enabled = False
          TabOrder = 4
        end
        object edtRubDevol: TEdit
          Left = 84
          Top = 111
          Width = 45
          Height = 21
          Enabled = False
          TabOrder = 8
        end
        object edtRubInf: TEdit
          Left = 84
          Top = 156
          Width = 45
          Height = 21
          Enabled = False
          TabOrder = 12
        end
        object btnLimpaRubN: TBitBtn
          Left = 489
          Top = 20
          Width = 24
          Height = 21
          Hint = 'Limpa a seleção de Contrato'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnLimpaRubNClick
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
        object btnLimpaRubA: TBitBtn
          Left = 489
          Top = 64
          Width = 24
          Height = 21
          Hint = 'Limpa a seleção de Contrato'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = btnLimpaRubAClick
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
        object btnLimpaRubD: TBitBtn
          Left = 489
          Top = 110
          Width = 24
          Height = 21
          Hint = 'Limpa a seleção de Contrato'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          OnClick = btnLimpaRubDClick
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
        object btnLimpaRubI: TBitBtn
          Left = 489
          Top = 154
          Width = 24
          Height = 21
          Hint = 'Limpa a seleção de Contrato'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 19
          OnClick = btnLimpaRubIClick
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
        object edtProvDescN: TEdit
          Left = 129
          Top = 21
          Width = 49
          Height = 21
          Enabled = False
          TabOrder = 1
        end
        object edtProvDescA: TEdit
          Left = 129
          Top = 65
          Width = 49
          Height = 21
          Enabled = False
          TabOrder = 5
        end
        object edtProvdescD: TEdit
          Left = 129
          Top = 111
          Width = 49
          Height = 21
          Enabled = False
          TabOrder = 9
        end
        object edtProvDescI: TEdit
          Left = 129
          Top = 156
          Width = 49
          Height = 21
          Enabled = False
          TabOrder = 13
        end
        object edtRubInfPgto: TEdit
          Left = 84
          Top = 202
          Width = 45
          Height = 21
          Enabled = False
          TabOrder = 15
        end
        object edtProvDescIPgto: TEdit
          Left = 129
          Top = 202
          Width = 49
          Height = 21
          Enabled = False
          TabOrder = 16
        end
        object DBcboRubInformativaPgto: TwwDBLookupCombo
          Left = 179
          Top = 202
          Width = 310
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'1'#9'Descrição'#9'F')
          LookupTable = dtmLookEmptmo.qryLookRubricaInfEmprestimo2
          LookupField = 'IDPROVENTO'
          DropDownCount = 4
          Enabled = False
          ParentFont = False
          TabOrder = 17
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnChange = DBcboRubInformativaPgtoChange
        end
        object btnLimpaRubPgto: TBitBtn
          Left = 489
          Top = 200
          Width = 24
          Height = 21
          Hint = 'Limpa a seleção de Contrato'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 18
          OnClick = btnLimpaRubPgtoClick
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
      object chkEstornoPosQuit: TCheckBox
        Left = 24
        Top = 255
        Width = 262
        Height = 17
        Caption = 'ESTORNAR o item após data de Quitação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
      end
      object rdgNaturezaItem: TRadioGroup
        Left = 376
        Top = 3
        Width = 201
        Height = 34
        Caption = ' Natureza do Item '
        Columns = 2
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Pagamento'
          'Recebimento')
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = rdgNaturezaItemClick
      end
      object chkCentraliza: TCheckBox
        Left = 590
        Top = 11
        Width = 155
        Height = 17
        Caption = 'Centralizador do Grupo'
        Enabled = False
        TabOrder = 1
        OnClick = chkCentralizaClick
      end
      object rdgTipoItem: TRadioGroup
        Left = 16
        Top = 48
        Width = 257
        Height = 185
        Caption = ' Evento '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Concessão/Renovação'
          'Prestação'
          'Amortização/Refinanciamento'
          'Quitação'
          'Atualização de Débito'
          'Atualização de Saldo Devedor (Diária)'
          'Importação/Migração'
          'Ajustes (Cobrança/Devolução)'
          'Ajustes (Saldo Devedor)')
        ParentFont = False
        TabOrder = 2
        OnClick = rdgTipoItemClick
      end
      object pnlCContabilBaixa: TPanel
        Left = 296
        Top = 222
        Width = 241
        Height = 73
        BevelOuter = bvNone
        TabOrder = 9
        object lblCCDebFinan: TLabel
          Left = 8
          Top = 2
          Width = 137
          Height = 13
          Caption = 'Conta Contábil de Baixa'
        end
        object Label14: TLabel
          Left = 7
          Top = 35
          Width = 174
          Height = 13
          Caption = 'Conta Contábil para Resultado'
        end
        object btnBuscaContaCBaixa: TBitBtn
          Left = 184
          Top = 15
          Width = 24
          Height = 22
          Hint = 'Busca uma Conta Contábil'
          TabOrder = 1
          OnClick = btnBuscaContaCBaixaClick
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
        object btnLimpaContaCBaixa: TBitBtn
          Left = 208
          Top = 15
          Width = 24
          Height = 22
          Hint = 'Limpa a seleção de conta contábil'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnLimpaContaCBaixaClick
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
        object edtContaCBaixa: TMaskEdit
          Left = 8
          Top = 16
          Width = 177
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object edtContaCBaixaDebitos: TMaskEdit
          Left = 8
          Top = 48
          Width = 176
          Height = 21
          TabOrder = 3
        end
        object btnBuscaContaCBaixaDebitos: TBitBtn
          Left = 185
          Top = 46
          Width = 24
          Height = 22
          Hint = 'Busca uma Conta de Resultado'
          TabOrder = 4
          OnClick = btnBuscaContaCBaixaDebitosClick
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
        object btnLimpaContaCBaixaDebitos: TBitBtn
          Left = 209
          Top = 46
          Width = 24
          Height = 22
          Hint = 'Limpa a seleção de conta Resultado'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = btnLimpaContaCBaixaDebitosClick
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
      object grpIncidencia: TRadioGroup
        Left = 749
        Top = 304
        Width = 163
        Height = 54
        Caption = ' Incidência '
        Color = clGray
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Todas as parcelas'
          'Algumas parcelas')
        ParentColor = False
        ParentFont = False
        TabOrder = 11
        Visible = False
        OnClick = grpIncidenciaClick
      end
      object grpPeriodicidade: TGroupBox
        Left = 748
        Top = 228
        Width = 163
        Height = 74
        Caption = ' Periodicidade '
        Color = clGray
        Enabled = False
        ParentColor = False
        TabOrder = 12
        Visible = False
        object Label7: TLabel
          Left = 26
          Top = 49
          Width = 78
          Height = 13
          Caption = 'Nº de vezes: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 106
          Top = 22
          Width = 50
          Height = 13
          Caption = 'Parcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 14
          Top = 22
          Width = 40
          Height = 13
          Caption = 'a cada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBspnParcelas: TwwDBSpinEdit
          Left = 50
          Top = 18
          Width = 49
          Height = 21
          Increment = 1
          MaxValue = 99
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object DBspnNumPeriodicidade: TwwDBSpinEdit
          Left = 104
          Top = 45
          Width = 49
          Height = 21
          Increment = 1
          MaxValue = 99
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
        end
      end
      inline molRegraCalculo: TmolRegraDB
        Left = 296
        Top = 45
        Width = 457
        TabOrder = 4
        inherited Regra: TLabel
          Width = 99
          Caption = 'Regra de Cálculo'
        end
        inherited DBedtRegra: TDBEdit
          Left = 56
          Width = 337
          Font.Height = -9
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited btnBuscaRegra: TBitBtn
          Left = 392
          OnClick = molRegraCalculobtnBuscaRegraClick
        end
        inherited btnLimpaRegra: TBitBtn
          Left = 416
          OnClick = molRegraCalculobtnLimpaRegraClick
        end
        inherited DBedtIDRegra: TDBEdit
          Width = 49
        end
      end
      object rdgAgrupadoDestacado: TRadioGroup
        Left = 304
        Top = 88
        Width = 289
        Height = 33
        Caption = ' Cobrança do Item '
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Agrupado'
          'Destacado')
        ParentFont = False
        TabOrder = 5
        OnClick = rdgAgrupadoDestacadoClick
      end
      object GroupBox1: TGroupBox
        Left = 544
        Top = 296
        Width = 193
        Height = 104
        TabOrder = 14
        object lblSeqCalculo: TLabel
          Left = 35
          Top = 14
          Width = 99
          Height = 13
          Alignment = taRightJustify
          Caption = 'Seq. de Cálculo: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 184
          Top = 0
          Width = 118
          Height = 13
          Alignment = taRightJustify
          Caption = 'Prioridade p/ Baixa: '
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        object lblSeqImpressao: TLabel
          Left = 20
          Top = 62
          Width = 114
          Height = 13
          Alignment = taRightJustify
          Caption = 'Seq. de Impressão: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 20
          Top = 38
          Width = 114
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ordem (p/ Extrato): '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBspnSeqCalculo: TwwDBSpinEdit
          Left = 136
          Top = 10
          Width = 49
          Height = 21
          Increment = 1
          MaxValue = 998
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object DBspnPrioridade: TwwDBSpinEdit
          Left = 176
          Top = -4
          Width = 49
          Height = 21
          Increment = 1
          MaxValue = 99
          MinValue = 1
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          UnboundDataType = wwDefault
          Visible = False
        end
        object spnSeqImpr: TwwDBSpinEdit
          Left = 136
          Top = 58
          Width = 49
          Height = 21
          Increment = 1
          MaxValue = 998
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          UnboundDataType = wwDefault
        end
        object chkImprimeInsc: TCheckBox
          Left = 22
          Top = 83
          Width = 147
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Impresso na Inscrição:'
          TabOrder = 4
        end
        object DBspnOrdemExtrato: TwwDBSpinEdit
          Left = 136
          Top = 34
          Width = 49
          Height = 21
          Increment = 1
          MaxValue = 998
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
        end
      end
      object pnlGrupoLanc: TPanel
        Left = 296
        Top = 184
        Width = 449
        Height = 41
        BevelOuter = bvNone
        TabOrder = 8
        object Label4: TLabel
          Left = 8
          Top = -2
          Width = 126
          Height = 13
          Caption = 'Grupo de Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBcboGrupoLanc: TwwDBLookupCombo
          Left = 8
          Top = 12
          Width = 433
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipOper
          LookupField = 'TIPCODIGO'
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
      end
      object chkGravaZeroHist: TCheckBox
        Left = 24
        Top = 237
        Width = 249
        Height = 17
        Caption = 'Grava histórico mesmo com valor ZERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object rdgTrataSaldoDev: TRadioGroup
        Left = 608
        Top = 98
        Width = 129
        Height = 78
        Caption = ' ao Saldo Devedor '
        ItemIndex = 0
        Items.Strings = (
          'Não tratar'
          'Abater'
          'Incorporar')
        TabOrder = 7
        TabStop = True
      end
      object chkNaoContabiliza: TCheckBox
        Left = 548
        Top = 219
        Width = 121
        Height = 17
        Caption = 'NÃO Contabilizar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
      end
      object rdgAlteraConcessao: TRadioGroup
        Left = 304
        Top = 128
        Width = 289
        Height = 49
        Caption = ' Valor na Alteração de Concessão '
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Valor calculado'
          'Sempre ZERO'
          'ZERO se positivo'
          'ZERO se negativo')
        ParentFont = False
        TabOrder = 6
        OnClick = rdgAgrupadoDestacadoClick
      end
      object chkEnviaPga: TCheckBox
        Left = 548
        Top = 235
        Width = 181
        Height = 17
        Caption = 'Transferir Valor para o PGA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 16
      end
      object chkEnviaSusp: TCheckBox
        Left = 24
        Top = 272
        Width = 262
        Height = 17
        Caption = 'Envia diferença em caso de suspensão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 18
        OnClick = chkEnviaSuspClick
      end
      object chkSuspensao: TCheckBox
        Left = 548
        Top = 251
        Width = 181
        Height = 17
        Caption = 'Passível para Suspensão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 17
      end
      object chkContabilizarDebitos: TCheckBox
        Left = 548
        Top = 268
        Width = 198
        Height = 17
        Caption = 'Contabilizar mesmo em caso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 19
      end
      object gbTransfPerfil: TGroupBox
        Left = 544
        Top = 403
        Width = 193
        Height = 57
        Caption = ' Transf. Perfil de Investimentos '
        TabOrder = 20
        object cbEntraTransf: TCheckBox
          Left = 9
          Top = 19
          Width = 171
          Height = 17
          Caption = 'Entrada de Transferência'
          TabOrder = 0
          OnClick = cbEntraTransfClick
        end
        object cbSaiTransf: TCheckBox
          Left = 9
          Top = 37
          Width = 171
          Height = 17
          Caption = 'Saída de Transferência'
          TabOrder = 1
          OnClick = cbSaiTransfClick
        end
      end
      object gbTipoItem: TGroupBox
        Left = 544
        Top = 464
        Width = 193
        Height = 73
        Caption = ' Tipo do Item a ser Transferido '
        TabOrder = 21
        object cbSaldoDev: TCheckBox
          Left = 9
          Top = 18
          Width = 171
          Height = 17
          Caption = 'Saldo Devedor'
          Enabled = False
          TabOrder = 0
          OnClick = cbSaldoDevClick
        end
        object cbSaldoVence: TCheckBox
          Left = 9
          Top = 36
          Width = 171
          Height = 17
          Caption = 'Saldo Vencido'
          Enabled = False
          TabOrder = 1
          OnClick = cbSaldoVenceClick
        end
        object cbProvisao: TCheckBox
          Left = 9
          Top = 54
          Width = 171
          Height = 17
          Caption = 'Provisão para Perdas'
          Enabled = False
          TabOrder = 2
          OnClick = cbProvisaoClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 544
    Width = 756
    inherited tb97Fundo: TToolbar97
      Left = 584
      DockPos = 626
      inherited bbtnSair: TBitBtn
        ModalResult = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 412
      DockPos = 454
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
      end
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
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IRC.ITEDESCRICAO,'
      '   REGRCALCULO.NOMEREGRA AS NOMEREGRCALCULO,'
      '   PROVNORMAL.DESCRICAO  AS DESCRUBNORMAL,'
      '   PROVATRASO.DESCRICAO  AS DESCRUBATRASO,'
      '   PROVDDEVOL.DESCRICAO  AS DESCRUBDDEVOL,'
      '   ITC.FLGCONTABILIZAPERDAEFETIVA,'
      '   ITC.CONTARESULTADO,'
      '   PROVINFORMATIVA.DESCRICAO  AS DESCRUBINFORMATIVA,'
      
        '   ITC.IDITEMEMPTMO , ITC.IDTIPOCONTREMPTMO, ITC.ITCEVENTO   , I' +
        'TC.ITCRECPAG    ,'
      
        '   ITC.IDREGRADEVOL , ITC.IDREGRADIARIA    , ITC.IDREGRACALC , I' +
        'TC.ITCSEQCALCULO,'
      
        '   ITC.FLGTEMPORARIO, ITC.FLGCENTRALIZA    , ITC.FLGDESTACADO, I' +
        'TC.CODTIPDOC    ,'
      
        '   ITC.ITCNUMVEZES  , ITC.ITCPERIODICIDADE , ITC.PLANO       , I' +
        'TC.ITCPRIORIDADE,'
      
        '   ITC.IDPROVENTON  , ITC.IDPROVENTOA      , ITC.IDPROVENTOD , I' +
        'TC.IDRUBRICADIFINFO  ,'
      
        '   ITC.TIPCODIGO    , ITC.ITCTRATASALDODEV , ITC.CONTABAIXA  , I' +
        'TC.FLGGRAVAZERO ,'
      
        '   ITC.ITCORDEMIMP  , ITC.ITCITEMIMPRESSO  , ITC.FLGNAOCONTAB, I' +
        'TC.FLGENVIAPGA,'
      '   ITC.ITCORDEMEXTRATO,'
      '   ITC.FLGVLRALTERACONC,'
      '   ITC.FLGESTORNOPOSQUIT,'
      '   ITC.FLGENVIADIFINFO,'
      '   ITC.IDRUBRICADIFINFOFPGTO,'
      '   NVL(ITC.FLGSUSPENSO,0) AS FLGSUSPENSO,'
      '   (select FLGESTORNOPOSQUIT'
      '    from   ITEMXTIPOCONTR'
      '    where  ITCEVENTO = ITC.ITCEVENTO'
      '    and    IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO'
      '    and    FLGCENTRALIZA = 1) as FLGESTORNOPOSQUITCEN'
      '   , ITC.FLGTRANSPERFIL'
      '   , ITC.FLGTIPOITEM'
      'FROM'
      '   ITEMXTIPOCONTR ITC,'
      '   ITEMEMPTMO     IRC,'
      '   REGRA          REGRCALCULO,'
      '   PROVDESC       PROVNORMAL,'
      '   PROVDESC       PROVATRASO,'
      '   PROVDESC       PROVDDEVOL,'
      '   PROVDESC       PROVINFORMATIVA'
      'WHERE'
      '       ( ITC.IDITEMEMPTMO      =:PIDITEMEMPTMO )'
      '   AND ( ITC.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      ''
      '   AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO )'
      '   AND ( ITC.IDREGRACALC       = REGRCALCULO.IDREGRA(+) )'
      '   AND ( ITC.IDPROVENTON       = PROVNORMAL.IDPROVENTO(+) )'
      '   AND ( ITC.IDPROVENTOA       = PROVATRASO.IDPROVENTO(+) )'
      '   AND ( ITC.IDPROVENTOD       = PROVDDEVOL.IDPROVENTO(+) )'
      '   AND ( ITC.IDRUBRICADIFINFO  = PROVINFORMATIVA.IDPROVENTO(+) )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 181
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDItemEmptmo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTipoContrEmptmo'
        ParamType = ptInput
      end>
    object qryITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryNOMEREGRCALCULO: TStringField
      FieldName = 'NOMEREGRCALCULO'
      Size = 60
    end
    object qryDESCRUBNORMAL: TStringField
      FieldName = 'DESCRUBNORMAL'
      Size = 130
    end
    object qryDESCRUBATRASO: TStringField
      FieldName = 'DESCRUBATRASO'
      Size = 130
    end
    object qryDESCRUBDDEVOL: TStringField
      FieldName = 'DESCRUBDDEVOL'
      Size = 130
    end
    object qryDESCRUBDESCRUBINFORMATIVA: TStringField
      FieldName = 'DESCRUBINFORMATIVA'
      Size = 130
    end
    object qryIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryITCEVENTO: TFloatField
      FieldName = 'ITCEVENTO'
    end
    object qryITCRECPAG: TStringField
      FieldName = 'ITCRECPAG'
      FixedChar = True
      Size = 1
    end
    object qryIDREGRADEVOL: TFloatField
      FieldName = 'IDREGRADEVOL'
    end
    object qryIDREGRADIARIA: TFloatField
      FieldName = 'IDREGRADIARIA'
    end
    object qryIDREGRACALC: TFloatField
      FieldName = 'IDREGRACALC'
    end
    object qryITCSEQCALCULO: TFloatField
      FieldName = 'ITCSEQCALCULO'
    end
    object qryFLGTEMPORARIO: TFloatField
      FieldName = 'FLGTEMPORARIO'
    end
    object qryFLGCENTRALIZA: TFloatField
      FieldName = 'FLGCENTRALIZA'
    end
    object qryFLGDESTACADO: TFloatField
      FieldName = 'FLGDESTACADO'
    end
    object qryCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object qryITCNUMVEZES: TFloatField
      FieldName = 'ITCNUMVEZES'
    end
    object qryITCPERIODICIDADE: TFloatField
      FieldName = 'ITCPERIODICIDADE'
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryITCPRIORIDADE: TFloatField
      FieldName = 'ITCPRIORIDADE'
    end
    object qryIDPROVENTON: TFloatField
      FieldName = 'IDPROVENTON'
    end
    object qryIDPROVENTOA: TFloatField
      FieldName = 'IDPROVENTOA'
    end
    object qryIDPROVENTOD: TFloatField
      FieldName = 'IDPROVENTOD'
    end
    object qryIDRUBRICADIFINFO: TFloatField
      FieldName = 'IDRUBRICADIFINFO'
    end
    object qryTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      FixedChar = True
      Size = 2
    end
    object qryITCTRATASALDODEV: TFloatField
      FieldName = 'ITCTRATASALDODEV'
    end
    object qryCONTABAIXA: TStringField
      FieldName = 'CONTABAIXA'
      FixedChar = True
      Size = 18
    end
    object qryFLGGRAVAZERO: TFloatField
      FieldName = 'FLGGRAVAZERO'
    end
    object qryITCORDEMIMP: TFloatField
      FieldName = 'ITCORDEMIMP'
    end
    object qryITCITEMIMPRESSO: TFloatField
      FieldName = 'ITCITEMIMPRESSO'
    end
    object qryFLGNAOCONTAB: TFloatField
      FieldName = 'FLGNAOCONTAB'
    end
    object qryFLGVLRALTERACONC: TFloatField
      FieldName = 'FLGVLRALTERACONC'
    end
    object qryITCORDEMEXTRATO: TFloatField
      FieldName = 'ITCORDEMEXTRATO'
    end
    object qryFLGESTORNOPOSQUIT: TFloatField
      FieldName = 'FLGESTORNOPOSQUIT'
    end
    object qryFLGESTORNOPOSQUITCEN: TFloatField
      FieldName = 'FLGESTORNOPOSQUITCEN'
    end
    object qryFLGENVIAPGA: TFloatField
      FieldName = 'FLGENVIAPGA'
    end
    object qryFLGENVIADIFINFO: TStringField
      FieldName = 'FLGENVIADIFINFO'
      Size = 1
    end
    object qryFLGSUSPENSO: TFloatField
      FieldName = 'FLGSUSPENSO'
    end
    object qryIDRUBRICADIFINFOFPGTO: TFloatField
      FieldName = 'IDRUBRICADIFINFOFPGTO'
    end
    object qryFLGCONTABILIZAPERDAEFETIVA: TFloatField
      FieldName = 'FLGCONTABILIZAPERDAEFETIVA'
    end
    object qryCONTARESULTADO: TStringField
      FieldName = 'CONTARESULTADO'
      FixedChar = True
      Size = 18
    end
    object qryFLGTRANSPERFIL: TStringField
      FieldName = 'FLGTRANSPERFIL'
      FixedChar = True
      Size = 1
    end
    object qryFLGTIPOITEM: TFloatField
      FieldName = 'FLGTIPOITEM'
    end
  end
  object qryAuxx: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 308
    Top = 9
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 253
    Top = 9
  end
end
