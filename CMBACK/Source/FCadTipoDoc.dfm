inherited frmCadTipoDoc: TfrmCadTipoDoc
  Top = 179
  Caption = 'Cadastro de Tipo de Documentos'
  ClientHeight = 290
  ClientWidth = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 490
    Height = 204
    inherited dbGrd: TwwDBGrid [0]
      Width = 480
      Height = 194
      Selected.Strings = (
        'DESCRICAO'#9'22'#9'Descrição'
        'FLGDOCFISCAL'#9'4'#9'Fiscal'
        'FLGGERANUMDOC'#9'7'#9'Num Doc'
        'FLGENGLOBAPARCELA'#9'8'#9'Eng/Parc'
        'CalcDebCre'#9'11'#9'Débito\Crédito')
      UseTFields = False
    end
    inherited pnlControles: TPanel [1]
      Width = 480
      Height = 194
      ParentFont = False
      object Bevel1: TBevel
        Left = 9
        Top = 126
        Width = 280
        Height = 57
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 10
        Top = 6
        Width = 58
        Height = 13
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 359
        Top = 6
        Width = 80
        Height = 13
        Caption = 'Cod Reduzido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedDescricao: TDBEdit
        Left = 10
        Top = 21
        Width = 340
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 10
        Top = 53
        Width = 277
        Height = 62
        BevelOuter = bvLowered
        TabOrder = 2
        object sbtnAcrescimo: TSpeedButton
          Left = 9
          Top = 14
          Width = 127
          Height = 34
          GroupIndex = 1
          Down = True
          Caption = 'Acréscimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7000777777777777700077770000077770007777066607777000777706660777
            7000777706660777700070000666000070007706666666077000777066666077
            7000777706660777700077777060777770007777770777777000777777777777
            7000}
          ParentFont = False
          OnClick = sbtnAcrescimoClick
        end
        object sbtnDecrescimo: TSpeedButton
          Left = 143
          Top = 14
          Width = 127
          Height = 34
          GroupIndex = 1
          Caption = 'Decréscimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7000777777777777700077777707777770007777706077777000777706660777
            7000777066666077700077066666660770007000066600007000777706660777
            7000777706660777700077770666077770007777000007777000777777777777
            7000}
          ParentFont = False
          OnClick = sbtnDecrescimoClick
        end
      end
      object dbeCodReduzido: TDBEdit
        Left = 359
        Top = 21
        Width = 110
        Height = 21
        DataField = 'CODREDUZIDO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object CkbDocFiscal: TDBCheckBox
        Left = 24
        Top = 158
        Width = 201
        Height = 17
        Caption = 'Consiste em Documento Fiscal'
        DataField = 'FLGDOCFISCAL'
        DataSource = ds
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object RgEmgParcela: TDBRadioGroup
        Left = 294
        Top = 47
        Width = 177
        Height = 69
        Caption = ' Engloba/Parcela '
        DataField = 'FLGENGLOBAPARCELA'
        DataSource = ds
        Items.Strings = (
          '&Sempre Engloba/Parcela'
          '&Não Engloba/Parcela'
          '&Definido pelo usuário')
        TabOrder = 3
        Values.Strings = (
          'S'
          'N'
          'A')
      end
      object CkbGeraNumDoc: TDBCheckBox
        Left = 24
        Top = 139
        Width = 252
        Height = 17
        Caption = 'Gera Número do Documento Automático'
        DataField = 'FLGGERANUMDOC'
        DataSource = ds
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 294
        Top = 119
        Width = 177
        Height = 65
        Caption = '  Serviço '
        DataField = 'FLGSERVICO'
        DataSource = ds
        Items.Strings = (
          '&Não Caracteriza'
          'Nota &Fiscal'
          '&Outros')
        TabOrder = 6
        Values.Strings = (
          'N'
          'F'
          'O')
      end
    end
  end
  inherited Dock972: TDock97
    Width = 490
  end
  inherited Dock971: TDock97
    Top = 251
    Width = 490
    inherited tb97Fundo: TToolbar97
      Left = 199
      DockPos = 199
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 31
      DockPos = 31
    end
  end
  inherited qry: TwwQuery
    OnCalcFields = qryCalcFields
    SQL.Strings = (
      'SELECT'
      '  CODTIPDOC,DESCRICAO,DEBCRE,RECPAG,IDUSUARIOINCLUSAO,'
      '  FLGENGLOBAPARCELA, FLGDOCFISCAL, CODREDUZIDO, FLGGERANUMDOC,'
      '  FLGDOCBANCARIO, FLGSERVICO'
      'FROM'
      '  TIPODOCRECPAG'
      'WHERE'
      '  RECPAG = :RECPAG '
      'ORDER BY DESCRICAO')
    ControlType.Strings = (
      'FLGDOCFISCAL;CheckBox;S;N'
      'FLGGERANUMDOC;CheckBox;S;N')
    Left = 295
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end>
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 34
      FieldName = 'DESCRICAO'
      Origin = 'TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object qryCalcDebCre: TStringField
      DisplayLabel = 'Débito\Crédito'
      DisplayWidth = 11
      FieldKind = fkCalculated
      FieldName = 'CalcDebCre'
      Size = 10
      Calculated = True
    end
    object qryCalcAcrescimo: TStringField
      DisplayLabel = 'Acréscimo'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'CalcAcrescimo'
      Visible = False
      Size = 1
      Calculated = True
    end
    object qryCalcDecrescimo: TStringField
      DisplayLabel = 'Decréscimo'
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'CalcDecrescimo'
      Visible = False
      Size = 1
      Calculated = True
    end
    object qryCODTIPDOC: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
    object qryDEBCRE: TStringField
      DisplayWidth = 1
      FieldName = 'DEBCRE'
      Origin = 'TIPODOCRECPAG.DEBCRE'
      Visible = False
      Size = 1
    end
    object qryRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'TIPODOCRECPAG.RECPAG'
      Visible = False
      Size = 1
    end
    object qryIDUSUARIOINCLUSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'TIPODOCRECPAG.IDUSUARIOINCLUSAO'
      Visible = False
    end
    object qryFLGENGLOBAPARCELA: TStringField
      DisplayLabel = 'Eng/Parc.'
      FieldName = 'FLGENGLOBAPARCELA'
      Origin = 'TIPODOCRECPAG.FLGENGLOBAPARCELA'
      Visible = False
      Size = 1
    end
    object qryFLGDOCFISCAL: TStringField
      DisplayLabel = 'Doc Fiscal.'
      DisplayWidth = 1
      FieldName = 'FLGDOCFISCAL'
      Origin = 'TIPODOCRECPAG.FLGDOCFISCAL'
      Visible = False
      Size = 1
    end
    object qryCODREDUZIDO: TStringField
      FieldName = 'CODREDUZIDO'
      Size = 3
    end
    object qryFLGGERANUMDOC: TStringField
      FieldName = 'FLGGERANUMDOC'
      Origin = 'TIPODOCRECPAG.FLGGERANUMDOC'
      Size = 1
    end
    object qryFLGDOCBANCARIO: TStringField
      FieldName = 'FLGDOCBANCARIO'
      Origin = 'TIPODOCRECPAG.FLGDOCBANCARIO'
      Size = 1
    end
    object qryFLGSERVICO: TStringField
      FieldName = 'FLGSERVICO'
      Origin = 'TIPODOCRECPAG.FLGSERVICO'
      Size = 1
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPODOCRECPAG'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  DEBCRE = :DEBCRE,'
      '  RECPAG = :RECPAG,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  FLGENGLOBAPARCELA = :FLGENGLOBAPARCELA,'
      '  FLGDOCFISCAL = :FLGDOCFISCAL,'
      '  CODREDUZIDO = :CODREDUZIDO,'
      '  FLGGERANUMDOC = :FLGGERANUMDOC,'
      '  FLGDOCBANCARIO = :FLGDOCBANCARIO,'
      '  FLGSERVICO = :FLGSERVICO'
      'where'
      '  CODTIPDOC = :OLD_CODTIPDOC')
    InsertSQL.Strings = (
      'insert into TIPODOCRECPAG'
      
        '  (CODTIPDOC, DESCRICAO, DEBCRE, RECPAG, IDUSUARIOINCLUSAO, FLGE' +
        'NGLOBAPARCELA, '
      
        '   FLGDOCFISCAL, CODREDUZIDO, FLGGERANUMDOC, FLGDOCBANCARIO, FLG' +
        'SERVICO)'
      'values'
      
        '  (:CODTIPDOC, :DESCRICAO, :DEBCRE, :RECPAG, :IDUSUARIOINCLUSAO,' +
        ' :FLGENGLOBAPARCELA, '
      
        '   :FLGDOCFISCAL, :CODREDUZIDO, :FLGGERANUMDOC, :FLGDOCBANCARIO,' +
        ' :FLGSERVICO)')
    DeleteSQL.Strings = (
      'delete from TIPODOCRECPAG'
      'where'
      '  CODTIPDOC = :OLD_CODTIPDOC')
    Left = 321
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPODOCRECPAG.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPODOCRECPAG')
    CamposChave.Strings = (
      'TIPODOCRECPAG.CODTIPDOC')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '35')
    Left = 373
  end
  inherited ds: TwwDataSource
    Left = 267
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 348
    Top = 58
  end
end
