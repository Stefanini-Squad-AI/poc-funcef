inherited frmSelRelPCMSO: TfrmSelRelPCMSO
  Caption = 'Emissão da Ficha PCMSO'
  ClientHeight = 263
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 224
    inherited PageControl1: TPageControl
      Height = 214
      inherited TabSheet2: TTabSheet
        object Label1: TLabel [0]
          Left = 40
          Top = 19
          Width = 88
          Height = 13
          Caption = 'Título da Ficha'
        end
        object Label2: TLabel [1]
          Left = 40
          Top = 75
          Width = 154
          Height = 13
          Caption = 'Quem Assina pela Empresa'
        end
        inherited BitBtn1: TBitBtn
          Left = 390
          Top = 128
          Visible = False
        end
        inherited BitBtn2: TBitBtn
          Left = 390
          Top = 68
          Visible = False
        end
        object edTituloFicha: TEdit
          Left = 40
          Top = 34
          Width = 313
          Height = 21
          TabOrder = 2
          Text = 'Ficha PCMSO'
        end
        object edAssinante: TEdit
          Left = 40
          Top = 89
          Width = 313
          Height = 21
          TabOrder = 3
        end
        object bbtnBuscaCID: TBitBtn
          Left = 355
          Top = 87
          Width = 30
          Height = 25
          Hint = 'Busca o Empregado'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = bbtnBuscaCIDClick
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
            1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
            1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
            1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
            00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
            FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
            FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
            104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
            1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
            1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
        end
        object rgResultado: TRadioGroup
          Left = 40
          Top = 136
          Width = 313
          Height = 40
          Caption = 'Inclui Avaliação e Observações no Resultado'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 5
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 224
    inherited tb97Fundo: TToolbar97
      Left = 80
      DockPos = 88
      inherited bbtnSair: TBitBtn
        Visible = True
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = True
      end
      inherited rbtnVisualizar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
      inherited rbtnImprimir: TBitBtn
        OnClick = rbtnImprimirClick
      end
    end
  end
  object MontaSelectFunc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'EMPRESAPROP'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA'
      'PESSOA.NOME'
      'FUNCIONARIO.IDESTAB')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 251
    Top = 122
  end
end
