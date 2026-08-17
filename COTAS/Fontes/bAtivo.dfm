inherited busAtivo: TbusAtivo
  Left = 156
  Top = 190
  Caption = 'Seleciona'
  ClientHeight = 397
  ClientWidth = 649
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 649
    Height = 358
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 647
      Height = 356
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = PageControlChange
      object TabSheet1: TTabSheet
        Caption = 'Condições'
        object Panel2: TPanel
          Left = 0
          Top = 288
          Width = 639
          Height = 32
          Align = alTop
          TabOrder = 0
        end
        object Panel3: TPanel
          Left = 0
          Top = 256
          Width = 639
          Height = 32
          Align = alTop
          TabOrder = 1
        end
        object Panel4: TPanel
          Left = 0
          Top = 224
          Width = 639
          Height = 32
          Align = alTop
          TabOrder = 2
        end
        object Panel5: TPanel
          Left = 0
          Top = 192
          Width = 639
          Height = 32
          Align = alTop
          TabOrder = 3
        end
        object Panel6: TPanel
          Left = 0
          Top = 160
          Width = 639
          Height = 32
          Align = alTop
          TabOrder = 4
        end
        object Panel7: TPanel
          Left = 0
          Top = 128
          Width = 639
          Height = 32
          Align = alTop
          TabOrder = 5
        end
        object Panel8: TPanel
          Left = 0
          Top = 96
          Width = 639
          Height = 32
          Align = alTop
          TabOrder = 6
        end
        object Panel9: TPanel
          Left = 0
          Top = 64
          Width = 639
          Height = 32
          Align = alTop
          TabOrder = 7
        end
        object Panel10: TPanel
          Left = 0
          Top = 32
          Width = 639
          Height = 32
          Align = alTop
          TabOrder = 8
          Visible = False
        end
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 639
          Height = 32
          Align = alTop
          TabOrder = 9
          object Label1: TLabel
            Left = 13
            Top = 11
            Width = 84
            Height = 13
            Caption = 'Nome do Ativo'
          end
          object cboNome: TComboBox
            Left = 160
            Top = 7
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'possui o texto'
              'é igual a')
          end
          object edtNome: TEdit
            Left = 319
            Top = 6
            Width = 258
            Height = 21
            TabOrder = 1
          end
          object chkNome: TCheckBox
            Left = 584
            Top = 8
            Width = 45
            Height = 17
            Caption = 'A=a'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 1
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 0
          Width = 631
          Height = 338
          Selected.Strings = (
            'IDCONTRATOEMPTMO'#9'13'#9'Nº Contrato'
            'DATACREDITO'#9'11'#9'Data Créd.'
            'SIT_CONTRATO'#9'15'#9'Situação'
            'NOME'#9'30'#9'Nome'
            'MATRICULA'#9'11'#9'Matrícula'
            'TCEDESCRICAO'#9'30'#9'Tipo Contrato'
            'DESCTIPOEMPTMO'#9'20'#9'Tipo Empréstimo'#9'F'
            'NOME_PLANO'#9'25'#9'Plano'
            'NOME_PATRO'#9'25'#9'Patrocinadora'
            'MATRICULA_TIT'#9'12'#9'Matr. Titular'
            'DATAASSINATURA'#9'18'#9'Data Assinatura'
            'INSCRICAO_TIT'#9'14'#9'Inscrição Prev.'
            'CPF'#9'18'#9'C.P.F.'
            'NOME_TIT'#9'60'#9'Nome Titular'
            'CPF_TIT'#9'18'#9'C.P.F. Titular'
            'SIT_PART'#9'50'#9'Situação'
            'SIT_PLANO'#9'50'#9'Situação no Plano')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsResultado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDblClick = btnOKClick
          OnKeyDown = wwDBGrid1KeyDown
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 358
    Width = 649
    inherited tb97Fundo: TToolbar97
      Left = 444
      DockPos = 444
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 165
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 84
        Caption = '&Buscar'
        ModalResult = 0
      end
      inherited bbtnCancelar: TBitBtn
        Left = 168
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
      object btnOK: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&OK'
        Default = True
        TabOrder = 2
        Visible = False
        OnClick = btnOKClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 923
    Top = 35
  end
  object qryResultado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   1 AS IDATIVOCOTA,'
      '   1 AS IDCARTEIRASPC,'
      
        '   '#39'012345678900123456789001234567890012345678900123456789001234' +
        '567890'#39' AS NOMEATIVO'
      'FROM'
      '   DUAL')
    ValidateWithMask = True
    Left = 424
    Top = 104
    object qryResultadoIDATIVOCOTA: TFloatField
      FieldName = 'IDATIVOCOTA'
    end
    object qryResultadoIDCARTEIRASPC: TFloatField
      FieldName = 'IDCARTEIRASPC'
    end
    object qryResultadoNOMEATIVO: TStringField
      FieldName = 'NOMEATIVO'
      FixedChar = True
      Size = 66
    end
  end
  object dsResultado: TDataSource
    DataSet = qryResultado
    Left = 421
    Top = 161
  end
end
