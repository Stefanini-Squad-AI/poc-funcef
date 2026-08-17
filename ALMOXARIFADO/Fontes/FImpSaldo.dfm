inherited FrmImpSaldo: TFrmImpSaldo
  Left = -15
  Top = 68
  Caption = 'Implantação de Saldo'
  ClientHeight = 351
  ClientWidth = 744
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 536
    Top = 200
    Width = 71
    Height = 13
    Caption = 'Custo Médio'
  end
  inherited pnlFundo: TPanel
    Width = 744
    Height = 265
    inherited pnlControles: TPanel
      Width = 742
      Height = 263
      object Grp: TGroupBox
        Left = 16
        Top = 16
        Width = 705
        Height = 225
        Caption = ' Almoxarifado '
        TabOrder = 0
        object Label3: TLabel
          Left = 24
          Top = 124
          Width = 102
          Height = 13
          Caption = 'Saldo Quantidade'
        end
        object Label4: TLabel
          Left = 368
          Top = 124
          Width = 48
          Height = 13
          Caption = 'Unidade'
        end
        object Label5: TLabel
          Left = 200
          Top = 124
          Width = 71
          Height = 13
          Caption = 'Custo Médio'
        end
        object Label7: TLabel
          Left = 520
          Top = 124
          Width = 100
          Height = 13
          Caption = 'Valor Ult. Compra'
        end
        object Label8: TLabel
          Left = 24
          Top = 176
          Width = 108
          Height = 13
          Caption = 'Atividade / Projeto'
        end
        object GrpArt: TGroupBox
          Left = 19
          Top = 24
          Width = 646
          Height = 89
          Caption = ' Artigo '
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 24
            Width = 40
            Height = 13
            Caption = 'Código'
          end
          object Label2: TLabel
            Left = 160
            Top = 24
            Width = 58
            Height = 13
            Caption = 'Descrição'
          end
          object dbCodArt: TDBEdit
            Left = 16
            Top = 40
            Width = 121
            Height = 21
            Color = clSilver
            DataField = 'CODARTIGO'
            DataSource = ds
            ReadOnly = True
            TabOrder = 0
          end
          object edDesc: TDBEdit
            Left = 160
            Top = 40
            Width = 465
            Height = 21
            Color = clSilver
            DataField = 'DESCPROD'
            DataSource = ds
            ReadOnly = True
            TabOrder = 1
          end
        end
        object edSaldo: TDBRealEdit
          Left = 24
          Top = 140
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 4
          NumberFormat = fNumber
          Signal = False
          DataField = 'SALDOQTDEMOV'
          DataSource = ds
        end
        object edCustoMed: TDBRealEdit
          Left = 200
          Top = 140
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 4
          NumberFormat = fNumber
          Signal = False
          DataField = 'CUSTOMEDIOMOV'
          DataSource = ds
        end
        object edUN: TDBEdit
          Left = 368
          Top = 140
          Width = 97
          Height = 21
          Color = clSilver
          DataField = 'CODMEDCUSTO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 3
        end
        object edValUltCompra: TDBRealEdit
          Left = 520
          Top = 140
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 4
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALULTCOMPRA'
          DataSource = ds
        end
        object dblcAtiv: TwwDBLookupCombo
          Left = 24
          Top = 192
          Width = 297
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'25'#9'Descrição'
            'UNIDNEGOC'#9'10'#9'Código')
          DataField = 'UNIDNEGOC'
          LookupTable = qryUnidNegoc
          LookupField = 'UNIDNEGOC'
          Options = [loTitles]
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 742
      Height = 263
      Selected.Strings = (
        'CODARTIGO'#9'14'#9'Código'
        'DESCPROD'#9'35'#9'Descrição'
        'CODMEDCUSTO'#9'4'#9'Unidade ~Medida'
        'SALDOQTDEMOV'#9'10'#9'Saldo~Inicial'
        'CUSTOMEDIOMOV'#9'10'#9'Custo Médio~Inicial'
        'VALULTCOMPRA'#9'10'#9'Valor~Ult. Compra')
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      TitleAlignment = taCenter
      TitleLines = 2
    end
  end
  inherited Dock972: TDock97
    Width = 744
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Caption = '&Implantar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
          FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
          990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
          990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
          FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
          00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
          00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
          00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
          03FF33337FFF77777333333300000333333F3333777773333333}
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 312
    Width = 744
    inherited tb97Fundo: TToolbar97
      Left = 572
      DockPos = 632
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 403
      DockPos = 440
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 747
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ARTIGO'
      'set'
      '  CODARTIGO = :CODARTIGO,'
      '  DESCPROD = :DESCPROD,'
      '  SALDOQTDE = :SALDOQTDE,'
      '  CUSTOMEDIO = :CUSTOMEDIO,'
      '  CODMEDCUSTO = :CODMEDCUSTO'
      'where'
      '  rtrim(CODARTIGO) = :OLD_CODARTIGO')
    InsertSQL.Strings = (
      'insert into ARTIGO'
      '  (CODARTIGO, DESCPROD, SALDOQTDE, CUSTOMEDIO, CODMEDCUSTO)'
      'values'
      '  (:CODARTIGO, :DESCPROD, :SALDOQTDE, :CUSTOMEDIO, :CODMEDCUSTO)')
    DeleteSQL.Strings = (
      'delete from ARTIGO'
      'where'
      '  CODARTIGO = :OLD_CODARTIGO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPPROD.CODGRUPOPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código do Grupo'
      'Descrição do Grupo')
    Tabelas.Strings = (
      'GRUPPROD')
    CamposChave.Strings = (
      'GRUPPROD.CODGRUPOPROD')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 318
    Top = 58
  end
  inherited qry: TwwQuery
    Tag = 0
    SQL.Strings = (
      ' SELECT'
      '      A.CODARTIGO,'
      '      A.VALULTCOMPRA,'
      '      P.DESCPROD,'
      '      M.SALDOQTDEMOV,'
      '      M.CUSTOMEDIOMOV,'
      '      P.CODMEDCUSTO'
      ' FROM'
      '    ARTIGO  A,'
      '    PRODUTO P,'
      '    MOVIMENT M'
      ' WHERE'
      '     ( P.CODGRUPOPROD = :pCODGRUPOPROD)'
      ' AND ( A.FLGATIVO = '#39'S'#39' )'
      ' AND ( P.CODPRODUTO = A.CODPRODUTO )'
      ' AND ( M.CODTIPOMOV(+) = '#39'Z'#39')'
      ' AND ( M.CODALMOXARIFADO(+) = :pCODALMOXARIFADO)'
      ' AND ( A.CODARTIGO = M.CODARTIGO(+) )'
      ''
      ' ORDER BY P.DESCPROD'
      ''
      ' ')
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODGRUPOPROD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end>
    object qryCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryDESCPROD: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCPROD'
      Size = 40
    end
    object qryCODMEDCUSTO: TStringField
      DisplayLabel = 'Unidade ~Medida'
      DisplayWidth = 4
      FieldName = 'CODMEDCUSTO'
      Size = 4
    end
    object qrySALDOQTDEMOV: TFloatField
      DisplayLabel = 'Saldo~Inicial'
      DisplayWidth = 10
      FieldName = 'SALDOQTDEMOV'
    end
    object qryCUSTOMEDIOMOV: TFloatField
      DisplayLabel = 'Custo Médio~Inicial'
      DisplayWidth = 10
      FieldName = 'CUSTOMEDIOMOV'
    end
    object qryVALULTCOMPRA: TFloatField
      DisplayLabel = 'Valor~Ult. Compra'
      DisplayWidth = 10
      FieldName = 'VALULTCOMPRA'
    end
  end
  object qryUnidNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     UNIDNEGOC,'
      '     NOME'
      'FROM'
      '     UNIDNEGOCIO'
      'WHERE'
      '     (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 414
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
