inherited frmCadRegEtp: TfrmCadRegEtp
  HelpContext = 1100014
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      object Label30: TLabel [2]
        Left = 266
        Top = 5
        Width = 118
        Height = 13
        Caption = 'Número do Processo'
        FocusControl = dbedNumJCJ
      end
      inherited StaticText1: TStaticText
        Width = 96
        Caption = 'Data da Citação'
      end
      object dbedJCJ: TDBEdit
        Left = 137
        Top = 20
        Width = 120
        Height = 21
        Color = clGray
        DataField = 'JCJ'
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
      object dbedNumJCJ: TDBEdit
        Left = 266
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
        TabOrder = 5
      end
      object rgSituacao: TDBRadioGroup
        Left = 266
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
        TabOrder = 6
        Values.Strings = (
          '0'
          '1')
      end
      object dbrgMateria: TDBRadioGroup
        Left = 394
        Top = 5
        Width = 320
        Height = 35
        Caption = 'Matéria'
        Columns = 2
        DataField = 'INDMATERIA'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Previd. Apenas'
          'Previd. e Trabalhista')
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Values.Strings = (
          '2'
          '3')
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
        TabOrder = 8
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
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Processo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.PROCJCJNUM'
      'VARAJUSTICA.DESCRICAO'
      'PROCESSOTRAB.FLGSITPROC'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCEXEC'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
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
      'Data de Citação'
      'Número Proc. na 1a Inst.'
      'Vara de Justiça'
      'Situação: 0=Abrt,1=Enc.'
      'Número Proc. na 2a Inst.'
      'Número Proc. na 3a Inst.'
      'Número na Precatória'
      'Número Proc. Interno')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'VARAJUSTICA')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA'
      'PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '40'
      '15'
      '15'
      '15'
      '25'
      '15')
  end
end
