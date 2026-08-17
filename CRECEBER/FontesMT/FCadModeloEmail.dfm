inherited FrmCadModeloEmail: TFrmCadModeloEmail
  Left = 387
  Top = 67
  Caption = 'Cadastro de E-mail'
  ClientHeight = 579
  ClientWidth = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 480
    Height = 493
    Align = alNone
    Caption = 'Cadastro de E-mail'
    object GrpInfoEmail: TGroupBox
      Left = 16
      Top = 10
      Width = 449
      Height = 175
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Informações do E-mail'
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 23
        Width = 121
        Height = 13
        Caption = 'Descrição do Modelo'
      end
      object LblAssuntoEmail: TLabel
        Left = 24
        Top = 69
        Width = 102
        Height = 13
        Caption = 'Assunto do E-mail'
      end
      object LblCaixaSaida: TLabel
        Left = 24
        Top = 117
        Width = 88
        Height = 13
        Caption = 'Caixa de Saída'
      end
      object lblCopiaOculta: TLabel
        Left = 237
        Top = 117
        Width = 144
        Height = 13
        Caption = 'Caixa para Cópia (oculta)'
      end
      object txtDescModelo: TDBEdit
        Left = 24
        Top = 40
        Width = 403
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object txtAssunto: TDBEdit
        Left = 24
        Top = 86
        Width = 403
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ASSUNTO'
        DataSource = ds
        TabOrder = 1
      end
      object txtCaixaSaida: TDBEdit
        Left = 24
        Top = 134
        Width = 193
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'CAIXASAIDA'
        DataSource = ds
        TabOrder = 2
      end
      object txtCopiaOculta: TDBEdit
        Left = 237
        Top = 134
        Width = 188
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'CAIXACCO'
        DataSource = ds
        TabOrder = 3
      end
    end
    object GrpCorpoEmail: TGroupBox
      Left = 16
      Top = 200
      Width = 449
      Height = 273
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Corpo do E-mail'
      TabOrder = 1
      object lblTags: TLabel
        Left = 123
        Top = 24
        Width = 29
        Height = 13
        Caption = 'Tags'
      end
      object lblCorpoEmail: TLabel
        Left = 1
        Top = 59
        Width = 448
        Height = 17
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Corpo do E-mail'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object cmbTags: TComboBox
        Left = 159
        Top = 22
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Nome do participante'
          'Matrícula do participante'
          'Data de Vencimento')
      end
      object bntTag: TBitBtn
        Left = 307
        Top = 20
        Width = 19
        Height = 23
        TabOrder = 1
        OnClick = bntTagClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E666666666
          608887F88888888887F887E666666666608887888888F888878F7E66666F6666
          66087F8888878F88887F7E6666FFF66666087F88887778F8887F7E666FFFFF66
          66087F888777778F887F7E66FFFFFFF666087F8877777778887F7E6666666666
          660878F888888888887887E666666666608887F88888888887F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object txtCorpoEmail: TDBMemo
        Left = 0
        Top = 76
        Width = 449
        Height = 197
        Anchors = [akLeft, akTop, akRight]
        DataField = 'CORPOEMAIL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
  end
  inherited Dock972: TDock97
    Width = 480
  end
  inherited Dock971: TDock97
    Top = 540
    Width = 480
    inherited tb97Fundo: TToolbar97
      Left = 308
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 139
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update MODELOEMAIL'
      'set'
      '  DESCRICAO = :DESCRICAO, '
      '  ASSUNTO = :ASSUNTO, '
      '  CAIXASAIDA = :CAIXASAIDA, '
      '  CAIXACCO = :CAIXACCO, '
      '  CORPOEMAIL = :CORPOEMAIL'
      'where'
      '  IDMODELOEMAIL = :OLD_IDMODELOEMAIL')
    InsertSQL.Strings = (
      'insert into MODELOEMAIL'
      
        '  (IDMODELOEMAIL, DESCRICAO, ASSUNTO, CAIXASAIDA, CAIXACCO, CORP' +
        'OEMAIL)'
      'values'
      
        '  (SEQIDMODELOEMAIL.NEXTVAL, :DESCRICAO, :ASSUNTO, :CAIXASAIDA, ' +
        ':CAIXACCO, :CORPOEMAIL)')
    DeleteSQL.Strings = (
      'delete from MODELOEMAIL'
      'where'
      '  IDMODELOEMAIL = :OLD_IDMODELOEMAIL')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MODELOEMAIL.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição do Modelo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'MODELOEMAIL')
    CamposChave.Strings = (
      'MODELOEMAIL.IDMODELOEMAIL')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    OperComparador.Strings = (
      '-1')
    ApenasLetraENum.Strings = (
      'N')
    ComparaMaiuscula.Strings = (
      '')
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Left = 277
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT IDMODELOEMAIL, DESCRICAO, ASSUNTO, CAIXASAIDA, CAIXACCO, ' +
        'CORPOEMAIL'
      '  FROM MODELOEMAIL'
      ' WHERE IDMODELOEMAIL = :IDMODELOEMAIL')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMODELOEMAIL'
        ParamType = ptInput
      end>
  end
end
