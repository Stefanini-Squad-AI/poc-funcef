inherited frmFormaRecPag: TfrmFormaRecPag
  Left = 492
  Top = 177
  Caption = 'Forma de Pagamento'
  ClientHeight = 270
  ClientWidth = 370
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 370
    Height = 184
    inherited pnlControles: TPanel
      Width = 360
      Height = 174
      object lblFormaRecPag: TLabel
        Left = 23
        Top = 48
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
      object dbedFormaRecPag: TDBEdit
        Left = 20
        Top = 69
        Width = 325
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
      object DBCheckBox1: TDBCheckBox
        Left = 24
        Top = 109
        Width = 238
        Height = 17
        Caption = 'Forma Vinculada a Dados Bancários'
        DataField = 'FLGDADOSBANCARIOS'
        DataSource = ds
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 360
      Height = 174
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Descrição')
      ParentFont = False
      TitleAlignment = taCenter
    end
  end
  inherited Dock972: TDock97
    Width = 370
  end
  inherited Dock971: TDock97
    Top = 231
    Width = 370
    inherited tb97Fundo: TToolbar97
      Left = 0
      DockPos = 0
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 170
      DockPos = 170
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '   CODFORMA,  RECPAG,  DESCRICAO,  IDPESSOA,  FLGDADOSBANCARIOS,' +
        ' IDUSUARIOINCLUSAO'
      'FROM'
      '   FORMARECPAG')
    Left = 192
    Top = 64
    object qryCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'FORMARECPAG.CODFORMA'
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'FORMARECPAG.RECPAG'
      Size = 1
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'FORMARECPAG.DESCRICAO'
      Size = 30
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'FORMARECPAG.IDPESSOA'
    end
    object qryFLGDADOSBANCARIOS: TStringField
      FieldName = 'FLGDADOSBANCARIOS'
      Origin = 'FORMARECPAG.FLGDADOSBANCARIOS'
      Size = 1
    end
    object qryIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'FORMARECPAG.IDUSUARIOINCLUSAO'
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update FORMARECPAG'
      'set'
      '  CODFORMA = :CODFORMA,'
      '  RECPAG = :RECPAG,'
      '  DESCRICAO = :DESCRICAO,'
      '  IDPESSOA = :IDPESSOA,'
      '  FLGDADOSBANCARIOS = :FLGDADOSBANCARIOS,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO'
      'where'
      '  CODFORMA = :OLD_CODFORMA')
    InsertSQL.Strings = (
      'insert into FORMARECPAG'
      
        '  (CODFORMA, RECPAG, DESCRICAO, IDPESSOA, FLGDADOSBANCARIOS, IDU' +
        'SUARIOINCLUSAO)'
      'values'
      
        '  (:CODFORMA, :RECPAG, :DESCRICAO, :IDPESSOA, :FLGDADOSBANCARIOS' +
        ', :IDUSUARIOINCLUSAO)')
    DeleteSQL.Strings = (
      'delete from FORMARECPAG'
      'where'
      '  CODFORMA = :OLD_CODFORMA')
    Left = 159
    Top = 64
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FORMARECPAG.DESCRICAO'
      'FORMARECPAG.RECPAG')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Rec\Pag')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FORMARECPAG')
    CamposChave.Strings = (
      'FORMARECPAG.CODFORMA'
      'FORMARECPAG.RECPAG'
      'FORMARECPAG.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '1')
    Left = 229
    Top = 64
  end
  inherited ds: TwwDataSource
    Left = 117
    Top = 64
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 348
    Top = 58
  end
end
