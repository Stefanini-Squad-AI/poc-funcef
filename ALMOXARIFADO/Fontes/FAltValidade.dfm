inherited FrmAltValidade: TFrmAltValidade
  Left = 39
  Top = 144
  Caption = 'Alteração de Validade dos Produtos'
  ClientHeight = 274
  ClientWidth = 696
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 696
    Height = 188
    inherited dbGrd: TwwDBGrid [0]
      Width = 686
      Height = 178
      Selected.Strings = (
        'DATAVALIDADE'#9'10'#9'Data~Validade'
        'CODARTIGO'#9'14'#9'Código'
        'DESCPROD'#9'30'#9'Descrção'
        'CODMEDIDA'#9'4'#9'Unid.'
        'QTDERECEBDEVOL'#9'10'#9'Qtde.'
        'VLRUNITARIO'#9'10'#9'Valor~Unitario'
        'VLRESTOQUE'#9'10'#9'Valor~Estoque ')
      TitleAlignment = taCenter
      TitleLines = 2
    end
    inherited pnlControles: TPanel [1]
      Width = 686
      Height = 178
      object calendario: TwwDBMonthCalendar
        Left = 0
        Top = 0
        Width = 686
        Height = 178
        Date = 37246.7357987384
        Time = 37246.7357987384
        Align = alClient
      end
    end
  end
  inherited Dock972: TDock97
    Width = 696
    object Label1: TLabel [0]
      Left = 250
      Top = 0
      Width = 81
      Height = 16
      Caption = 'Nº da Nota:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [1]
      Left = 246
      Top = 24
      Width = 85
      Height = 16
      Caption = 'Fornecedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText [2]
      Left = 336
      Top = 24
      Width = 60
      Height = 16
      AutoSize = True
      DataField = 'RAZAOSOCIAL'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText [3]
      Left = 336
      Top = 0
      Width = 60
      Height = 16
      AutoSize = True
      DataField = 'NUMNOTA'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 235
    Width = 696
    inherited tb97Fundo: TToolbar97
      Left = 526
      DockPos = 528
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 359
      DockPos = 361
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      I.IDITENSRECDEV,'
      '      I.NUMOC,'
      '      I.CODARTIGO,'
      '      I.CODALMOXARIFADO,'
      '      I.CODMEDIDA,'
      '      I.IDMOV,'
      '      I.IDPESSOA,'
      '      I.IDNFRECEBDEVOL,'
      '      I.QTDERECEBDEVOL,'
      '      I.VLRUNITARIO,'
      '      I.VLRESTOQUE,'
      '      (I.QTDERECEBDEVOL* I.VLRUNITARIO) AS VALORTOTAL,'
      '      I.DATAVALIDADE,'
      '      I.IDPRODVARI,'
      
        '      SUBSTR(DECODE(I.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI' +
        '),1,60)  AS DESCPROD,'
      '      TO_CHAR(NF.NUMNF) || '#39'/'#39' || (NF.COMPLNF) AS NUMNOTA,'
      '      PE.RAZAOSOCIAL'
      'FROM'
      '      ITENSRECEBDEVOL I,'
      '      NFRECEBDEVOL NF,'
      '      PESSOA PE,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV'
      'WHERE'
      '        (I.IDNFRECEBDEVOL = :IDNFRECEBDEVOL )'
      '    AND (I.DATAVALIDADE IS NOT NULL)'
      '    AND (I.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL)'
      '    AND (NF.IDFORCLI = PE.IDPESSOA)'
      '    AND (I.CODARTIGO = A.CODARTIGO)'
      '    AND (P.CODPRODUTO = A.CODPRODUTO)'
      '    AND (PV.IDPRODVARI(+) = I.IDPRODVARI)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 466
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDNFRECEBDEVOL'
        ParamType = ptInput
      end>
    object qryDATAVALIDADE: TDateTimeField
      DisplayLabel = 'Data~Validade'
      DisplayWidth = 10
      FieldName = 'DATAVALIDADE'
    end
    object qryCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      FixedChar = True
      Size = 14
    end
    object qryDESCPROD: TStringField
      DisplayLabel = 'Descrção'
      DisplayWidth = 30
      FieldName = 'DESCPROD'
      Size = 60
    end
    object qryCODMEDIDA: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      FixedChar = True
      Size = 4
    end
    object qryQTDERECEBDEVOL: TFloatField
      DisplayLabel = 'Qtde.'
      DisplayWidth = 10
      FieldName = 'QTDERECEBDEVOL'
    end
    object qryVLRUNITARIO: TFloatField
      DisplayLabel = 'Valor~Unitario'
      DisplayWidth = 10
      FieldName = 'VLRUNITARIO'
    end
    object qryVLRESTOQUE: TFloatField
      DisplayLabel = 'Valor~Estoque '
      DisplayWidth = 10
      FieldName = 'VLRESTOQUE'
    end
    object qryIDITENSRECDEV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITENSRECDEV'
      Visible = False
    end
    object qryNUMOC: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMOC'
      Visible = False
    end
    object qryIDMOV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOV'
      Visible = False
    end
    object qryIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryIDNFRECEBDEVOL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDNFRECEBDEVOL'
      Visible = False
    end
    object qryVALORTOTAL: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
      Visible = False
    end
    object qryIDPRODVARI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPRODVARI'
      Visible = False
    end
    object qryNUMNOTA: TStringField
      DisplayWidth = 46
      FieldName = 'NUMNOTA'
      Visible = False
      Size = 46
    end
    object qryRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 776
    Top = 65534
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ITENSRECEBDEVOL'
      'set'
      '  DATAVALIDADE = :DATAVALIDADE'
      'where'
      '  IDITENSRECDEV = :OLD_IDITENSRECDEV')
    InsertSQL.Strings = (
      'insert into ITENSRECEBDEVOL'
      '  (DATAVALIDADE)'
      'values'
      '  (:DATAVALIDADE)')
    DeleteSQL.Strings = (
      'delete from ITENSRECEBDEVOL'
      'where'
      '  IDITENSRECDEV = :OLD_IDITENSRECDEV')
    Left = 507
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NOME'
      'NFRECEBDEVOL.NUMNF'
      'NFRECEBDEVOL.COMPLNF'
      'NFRECEBDEVOL.DATAEMISNF'
      'NFRECEBDEVOL.DATAENTDEVOL'
      'NFRECEBDEVOL.VLRNOTAFISCAL'
      'ITENSRECEBDEVOL.CODARTIGO'
      'PRODUTO.DESCPROD'
      'ITENSRECEBDEVOL.DATAVALIDADE')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'D'
      'D'
      'N'
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Razão Social'
      'Nome do Fornecedor'
      'Número da NF'
      'Complemento'
      'Data de Emissão'
      'Data da Entrada'
      'Valor da Nota'
      'Código do Artigo'
      'Descrição do Artigo'
      'Data de Validade')
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
      'NFRECEBDEVOL'
      'PESSOA'
      'ITENSRECEBDEVOL'
      'ARTIGO'
      'PRODUTO')
    CamposChave.Strings = (
      'NFRECEBDEVOL.IDNFRECEBDEVOL')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = NFRECEBDEVOL.IDFORCLI'
      'ITENSRECEBDEVOL.IDNFRECEBDEVOL = NFRECEBDEVOL.IDNFRECEBDEVOL'
      'ITENSRECEBDEVOL.CODARTIGO = ARTIGO.CODARTIGO'
      'ARTIGO.CODPRODUTO = PRODUTO.CODPRODUTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '#,##0.00'
      ''
      ''
      '')
    Larguras.Strings = (
      '45'
      '30'
      '10'
      '5'
      '10'
      '10'
      '10'
      '14'
      '40'
      '18')
    Left = 645
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 547
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 713
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 92
    Top = 6
  end
end
