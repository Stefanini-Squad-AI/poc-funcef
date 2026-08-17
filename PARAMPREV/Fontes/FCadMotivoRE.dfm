inherited FrmCadMotivoRE: TFrmCadMotivoRE
  Top = 192
  Caption = 'Cadastro de Motivos de Retenção e Encerramento'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object lblNome: TLabel
      Left = 24
      Top = 40
      Width = 39
      Height = 13
      Caption = 'Motivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbedMotivo: TDBEdit
      Left = 24
      Top = 55
      Width = 289
      Height = 21
      Ctl3D = True
      DataField = 'DS_MOTIVO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object DBRdTipo: TDBRadioGroup
      Left = 24
      Top = 88
      Width = 164
      Height = 105
      Caption = ' Tipo '
      DataField = 'TP_MOTIVO'
      DataSource = ds
      Items.Strings = (
        'Retenção'
        'Encerramento'
        'Ambos')
      TabOrder = 1
      Values.Strings = (
        'R'
        'E'
        'T')
    end
    object GbSituacaxo: TGroupBox
      Left = 200
      Top = 88
      Width = 316
      Height = 105
      TabOrder = 2
      object DBChcAtivo: TDBCheckBox
        Left = 16
        Top = 14
        Width = 97
        Height = 17
        Caption = 'Ativo'
        DataField = 'FLGATIVO'
        DataSource = ds
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBChkSaidaConvenio: TDBCheckBox
        Left = 16
        Top = 35
        Width = 169
        Height = 17
        Caption = 'Saída do Convênio'
        DataField = 'FLGSAIDACONVENIO'
        DataSource = ds
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox1: TDBCheckBox
        Left = 16
        Top = 57
        Width = 169
        Height = 17
        Caption = 'Falecimento'
        DataField = 'FLGFALECIMENTO'
        DataSource = ds
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBChkAcertoFinan: TDBCheckBox
        Left = 16
        Top = 79
        Width = 257
        Height = 17
        Caption = 'Não Permite Acertos Financeiros'
        DataField = 'FLGNPERMFINANC'
        DataSource = ds
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE MOTIVORE'
      '   SET DS_MOTIVO        = :DS_MOTIVO,'
      '       TP_MOTIVO        = :TP_MOTIVO,'
      '       FLGATIVO         =  nvl(:flgativo,0),'
      '       FLGSAIDACONVENIO = nvl(:flgsaidaconvenio,0),'
      '       FLGFALECIMENTO = nvl(:flgfalecimento,0),'
      '       FLGNPERMFINANC= nvl(:FLGNPERMFINANC,0)'
      ' WHERE ID_MOTIVO = :OLD_ID_MOTIVO')
    InsertSQL.Strings = (
      'insert into motivore'
      '  (id_motivo,'
      '   ds_motivo,'
      '   tp_motivo,'
      '   flgativo,'
      '   flgsaidaconvenio,'
      '   flgfalecimento,'
      '   FLGNPERMFINANC)'
      'values'
      '  (:id_motivo,'
      '   :ds_motivo,'
      '   :tp_motivo,'
      '   nvl(:flgativo,0),'
      '   nvl(:flgsaidaconvenio,0),'
      '   nvl(:flgfalecimento,0),'
      '   nvl(:FLGNPERMFINANC,0) )'
      ' ')
    DeleteSQL.Strings = (
      'delete motivore'
      ' where id_motivo = :Old_id_motivo')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ID_MOTIVO'
      'DS_MOTIVO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'MOTIVORE')
    CamposChave.Strings = (
      'ID_MOTIVO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      
        'SELECT ID_MOTIVO, DS_MOTIVO, TP_MOTIVO, FLGATIVO,  FLGSAIDACONVE' +
        'NIO, flgfalecimento, FLGNPERMFINANC FROM MOTIVORE')
  end
end
