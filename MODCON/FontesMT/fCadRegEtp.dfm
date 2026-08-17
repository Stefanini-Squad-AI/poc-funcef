inherited frmCadRegEtp: TfrmCadRegEtp
  Left = 444
  Top = 71
  HelpContext = 7190020
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      object Label30: TLabel [2]
        Left = 137
        Top = 5
        Width = 118
        Height = 13
        Caption = 'Número do Processo'
        FocusControl = dbedNumJCJ
      end
      inherited StaticText1: TStaticText
        Width = 119
        Caption = 'Data Notif./ Citação'
      end
      object dbedNumJCJ: TDBEdit
        Left = 137
        Top = 20
        Width = 120
        Height = 21
        Color = clGray
        DataField = 'PROCJCJNUM'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object rgSituacao: TDBRadioGroup
        Left = 264
        Top = 44
        Width = 120
        Height = 49
        Caption = 'Situação'
        DataField = 'FLGSITPROC'
        DataSource = ds
        Enabled = False
        Items.Strings = (
          'Aberto'
          'Encerrado')
        ReadOnly = True
        TabOrder = 5
        Values.Strings = (
          '0'
          '1')
      end
      object CMProcuraReq: TCMProcuraSubTipo
        Left = 394
        Top = 44
        Width = 320
        Height = 50
        Caption = 'Contraparte'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        CampoEdit = ceNome
        MostraMensagens = True
        DataSource = ds
        DataField = 'IDRECLAMANTE'
        Mensagens.EmBranco = 'Contra Parte não pode estar em branco'
        Mensagens.NaoExiste = 'Contra Parte não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        SubTipo = stElegivel
        FiltraSubTipo = True
      end
      object dbrgMateria: TDBRadioGroup
        Left = 264
        Top = 4
        Width = 447
        Height = 38
        Caption = 'Matéria'
        Columns = 7
        DataField = 'INDMATERIA'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Trab.'
          'Prev.'
          'Pr/Trb.'
          'Civil'
          'Coml.'
          'Tribut.'
          'Penal')
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Values.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7')
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Processo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.INDMATERIA'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.PROCJCJNUM'
      'VARAJUSTICA.DESCRICAO'
      'PROCESSOTRAB.NUMVARAJUSTICA'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCEXEC'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'N'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Contraparte'
      'Matéria (1 a 7)'
      'Data de Notificação'
      'Número Proc. na 1a Inst.'
      'Vara de Justiça'
      'Número da Vara'
      'Número Proc. na 2a Inst.'
      'Número Proc. na 3a Inst.'
      'Número na Execução'
      'Número Proc. Interno')
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
      'PESSOA'
      'PROCESSOTRAB'
      'VARAJUSTICA')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA'
      'PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '12'
      '12'
      '15'
      '40'
      '15'
      '15'
      '15'
      '25'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
  end
  inherited CdsTipoReceb: TCMClientDataSet
    Left = 616
    Top = 253
  end
end
