inherited frmCadObraCAF: TfrmCadObraCAF
  Left = 11
  Top = 90
  HelpContext = 540049
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      Height = 177
      object Label22: TLabel [5]
        Left = 384
        Top = 129
        Width = 97
        Height = 13
        Caption = 'Tipo de Despesa'
      end
      object lblEncerrado: TfcLabel [6]
        Left = 528
        Top = 25
        Width = 207
        Height = 20
        Caption = 'Encerrado em 99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
        Transparent = True
      end
      inherited dbeDescObra: TwwDBRichEdit
        RichEditVersion = 2
        Data = {
          810000007B5C727466315C616E73695C616E7369637067313235325C64656666
          305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
          4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
          5C706172645C625C66305C6673313420646265446573634F6272615C7061720D
          0A7D0D0A00}
      end
      object DBcboTipoRecDes: TwwDBLookupCombo
        Left = 384
        Top = 143
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCUSTORECIMO'#9'30'#9'Tipo de Despesa')
        DataField = 'IDTIPOCUSTORECIMO'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookTipoRecDes
        LookupField = 'IDTIPOCUSTORECIMO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      inline molImovel1: TmolImovel
        Left = 8
        Top = 126
        Width = 369
        TabOrder = 9
        inherited edtImovel: TEdit
          Width = 337
        end
        inherited btnBuscaImovel: TBitBtn
          Left = 344
          Width = 21
          Height = 21
          OnClick = molImovel1btnBuscaImovelClick
        end
        inherited btnLimpaImovel: TBitBtn
          Left = 128
          Enabled = False
          Visible = False
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 178
      Height = 182
      inherited Dock974: TDock97
        Height = 123
      end
      inherited pgctrlDetalhe: TPageControl
        Height = 123
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Height = 95
          end
          inherited dbgrdDet: TwwDBGrid
            Height = 95
          end
        end
      end
    end
  end
  inherited qrySelSubConta: TwwQuery
    Left = 536
    Top = 144
  end
  object qryImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IM.IMONOME || '#39' - '#39' || I.IMONOME AS NOMEIMOVEL,'
      '      I.FLGATIVO'
      ''
      'FROM  IMOVEL I,'
      '      IMOVEL IM'
      'WHERE'
      '      (I.IDIMOVEL = :PIDIMOVEL)'
      '  AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
    object qryImovelNOMEIMOVEL: TStringField
      FieldName = 'NOMEIMOVEL'
      Origin = 'BASEDADOS.IMOVEL.IMONOME'
      Size = 123
    end
    object qryImovelFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
      Origin = 'BASEDADOS.IMOVEL.FLGATIVO'
    end
  end
  object qryInsTransferencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TRANSFBEMIMOVEL'
      
        '   (IDMOVIMENTACAO, IDIMOVELORIG, IDIMOVELDEST, FLGOPERACAO, COD' +
        'TIPIMOVELANT)'
      'VALUES'
      
        '   (:PIDMOVIMENTACAO, :PIDIMOVELORIG, :PIDIMOVELDEST, :PFLGOPERA' +
        'CAO, :PCODTIPIMOVELANT)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 161
    Top = 322
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELDEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVELANT'
        ParamType = ptUnknown
      end>
  end
end
