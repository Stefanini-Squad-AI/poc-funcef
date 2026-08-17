inherited frmCadOutroDadoXTipoImovel: TfrmCadOutroDadoXTipoImovel
  Left = 282
  Top = 155
  Caption = 'Dados Complementares por Tipo de Imóvel'
  ClientHeight = 327
  ClientWidth = 358
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 358
    Height = 294
    inherited Panel1: TPanel
      Width = 356
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 85
        Height = 13
        Caption = 'Tipo de Imóvel'
      end
      object DBcboTipoImovel: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOIMOVEL'#9'25'#9'DESCTIPOIMOVEL'#9'No')
        LookupTable = dtmLookImobiliario.qryLookTipoImovel
        LookupField = 'CODTIPIMOVEL'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        OnCloseUp = DBcboTipoImovelCloseUp
      end
    end
    inherited pgc: TPageControl
      Width = 356
      Height = 232
      inherited tbs: TTabSheet
        inherited Dock973: TDock97
          Width = 348
        end
        inherited pnlControles: TPanel
          Width = 348
          Height = 63
          object Label3: TLabel
            Left = 12
            Top = 10
            Width = 161
            Height = 13
            Caption = 'Tipo de Dado Complementar'
          end
          object Bevel1: TBevel
            Left = 12
            Top = 56
            Width = 317
            Height = 2
            Shape = bsTopLine
          end
          object DBcboOutroDado: TwwDBLookupCombo
            Left = 12
            Top = 24
            Width = 317
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'ODODESCRICAO'#9'40'#9'ODODESCRICAO')
            DataField = 'IDOUTRODADO'
            DataSource = ds
            LookupTable = dtmLookImobiliario.qryLookOutroDado
            LookupField = 'IDOUTRODADO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
        inherited pnlGrd: TPanel
          Top = 94
          Width = 348
          Height = 128
          inherited DBgrd: TwwDBGrid
            Left = 12
            Top = 8
            Width = 317
            Selected.Strings = (
              'ODODESCRICAO'#9'40'#9'Tipo de Dado Complementar')
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 294
    Width = 358
    inherited tb97Fundo: TToolbar97
      Left = 179
      DockPos = 179
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 2
      DockPos = 2
    end
  end
  inherited ds: TwwDataSource
    DataSet = qry
    Left = 264
    Top = 21
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 77
    Top = 21
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OUTRODADOXTIPOIMO'
      'set'
      '  CODTIPIMOVEL = :CODTIPIMOVEL,'
      '  IDOUTRODADO = :IDOUTRODADO'
      'where'
      '  CODTIPIMOVEL = :OLD_CODTIPIMOVEL and'
      '  IDOUTRODADO = :OLD_IDOUTRODADO')
    InsertSQL.Strings = (
      'insert into OUTRODADOXTIPOIMO'
      '  (CODTIPIMOVEL, IDOUTRODADO)'
      'values'
      '  (:CODTIPIMOVEL, :IDOUTRODADO)')
    DeleteSQL.Strings = (
      'delete from OUTRODADOXTIPOIMO'
      'where'
      '  CODTIPIMOVEL = :OLD_CODTIPIMOVEL and'
      '  IDOUTRODADO = :OLD_IDOUTRODADO')
    Left = 200
    Top = 21
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   OXT.CODTIPIMOVEL, OXT.IDOUTRODADO,'
      ''
      '   O.ODODESCRICAO'
      ''
      'FROM'
      '   OUTRODADOXTIPOIMO OXT,'
      '   OUTRODADO O'
      ''
      'WHERE'
      '   ( OXT.CODTIPIMOVEL =:PCODTIPIMOVEL )'
      '   AND ( OXT.IDOUTRODADO = O.IDOUTRODADO )'
      ''
      'ORDER BY'
      '   O.ODODESCRICAO')
    UpdateObject = upd
    Left = 232
    Top = 21
    ParamData = <
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end>
    object qryODODESCRICAO: TStringField
      DisplayLabel = 'Tipo de Dado Complementar'
      DisplayWidth = 40
      FieldName = 'ODODESCRICAO'
      Origin = '"CM.OUTRODADO".ODODESCRICAO'
      Size = 40
    end
    object qryCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'OUTRODADOXTIPOIMO.CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
    object qryIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
      Origin = 'OUTRODADOXTIPOIMO.IDOUTRODADO'
      Visible = False
    end
  end
end
