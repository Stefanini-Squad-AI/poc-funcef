inherited frmParamCnabSantanderMT: TfrmParamCnabSantanderMT
  Left = 272
  Top = 126
  Caption = 'Parâmetros para Configuração de Remessa para o Banco Santander'
  ClientHeight = 454
  ClientWidth = 599
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 599
    Height = 415
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 589
      Height = 405
      ActivePage = TbsMensagens
      Align = alClient
      TabOrder = 0
      object TbsMensagens: TTabSheet
        Caption = 'Geral I'
        object Label15: TLabel
          Left = 29
          Top = 4
          Width = 524
          Height = 26
          Alignment = taCenter
          Caption = 
            'Atenção: Os Dados informados nesta seção são genéricos e serão a' +
            'ssociados a TODOS os documentos do arquivo'
          Color = clScrollBar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          WordWrap = True
        end
        object GroupBox2: TGroupBox
          Left = 5
          Top = 35
          Width = 571
          Height = 336
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 10
            Top = 15
            Width = 551
            Height = 105
            Caption = ' Mensagens para Ficha de Compensação '
            TabOrder = 0
            object Label1: TLabel
              Left = 14
              Top = 17
              Width = 179
              Height = 13
              Caption = '1º Mensagem - Lote do Arquivo'
            end
            object Label3: TLabel
              Left = 14
              Top = 57
              Width = 179
              Height = 13
              Caption = '2º Mensagem - Lote do Arquivo'
            end
            object edtMensagem1: TMaskEdit
              Left = 13
              Top = 33
              Width = 523
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 40
              TabOrder = 0
            end
            object edtMensagem2: TMaskEdit
              Left = 13
              Top = 73
              Width = 523
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 40
              TabOrder = 1
            end
          end
          object rgTipoCobranca: TRadioGroup
            Left = 10
            Top = 124
            Width = 286
            Height = 87
            Caption = ' Tipo de Cobrança '
            ItemIndex = 0
            Items.Strings = (
              '1 - Cobrança Simples'
              '3 - Cobrança Caucionada'
              '4 - Cobrança Descontada'
              '5 - Cobrança Simples (Rápida com Registro)')
            TabOrder = 1
          end
          object rgFormaCadastramento: TRadioGroup
            Left = 300
            Top = 124
            Width = 261
            Height = 87
            Caption = ' Forma de Cadastramento '
            ItemIndex = 0
            Items.Strings = (
              '1 - Cobrança Registrada'
              '2 - Cobrança sem Registro')
            TabOrder = 3
          end
          object rgAceite: TRadioGroup
            Left = 300
            Top = 214
            Width = 261
            Height = 62
            Caption = ' Ident. de Título Aceite/Não Aceite '
            ItemIndex = 0
            Items.Strings = (
              'A - Aceite'
              'N - Não Aceite')
            TabOrder = 4
          end
          object rgEspecieTitulo: TRadioGroup
            Left = 10
            Top = 213
            Width = 286
            Height = 113
            Caption = ' Espécie do Título '
            ItemIndex = 0
            Items.Strings = (
              'Duplicata'
              'Duplicata de Serviço'
              'Nota Promissória'
              'Recibo'
              'Apólice de Seguro')
            TabOrder = 2
          end
        end
      end
      object TbsGeral: TTabSheet
        Caption = 'Geral II'
        ImageIndex = 1
        object Label4: TLabel
          Left = 29
          Top = 4
          Width = 524
          Height = 26
          Alignment = taCenter
          Caption = 
            'Atenção: Os Dados informados nesta seção são genéricos e serão a' +
            'ssociados a TODOS os documentos do arquivo'
          Color = clScrollBar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          WordWrap = True
        end
        object GroupBox3: TGroupBox
          Left = 5
          Top = 35
          Width = 571
          Height = 336
          TabOrder = 0
          object rgCodigoMora: TRadioGroup
            Left = 10
            Top = 9
            Width = 386
            Height = 92
            Caption = ' Código de Mora '
            ItemIndex = 0
            Items.Strings = (
              '1 - Valor por Dia'
              '2 - Taxa Mensal'
              '3 - Isento'
              '4 - Utilizar comissão permanência do Banco por dia de atraso')
            TabOrder = 0
            OnClick = rgCodigoMoraClick
          end
          object gbiof: TGroupBox
            Left = 10
            Top = 107
            Width = 256
            Height = 109
            Caption = ' Outros '
            TabOrder = 2
            object Label9: TLabel
              Left = 12
              Top = 79
              Width = 86
              Height = 13
              Caption = 'Percentual IOF'
            end
            object Label14: TLabel
              Left = 13
              Top = 50
              Width = 114
              Height = 13
              Caption = 'Dia(s) para Protesto'
            end
            object Label2: TLabel
              Left = 13
              Top = 20
              Width = 157
              Height = 13
              Caption = 'Dias para Baixa/Devolução'
            end
            object RedtIOF: TRealEdit
              Left = 130
              Top = 76
              Width = 112
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 5
              NumberFormat = fNumber
              Signal = False
            end
            object speProtesto: TSpinEdit
              Left = 191
              Top = 45
              Width = 51
              Height = 22
              MaxValue = 999
              MinValue = 0
              TabOrder = 1
              Value = 0
            end
            object speDiasBaixa: TSpinEdit
              Left = 191
              Top = 15
              Width = 51
              Height = 22
              MaxValue = 999
              MinValue = 0
              TabOrder = 0
              Value = 0
            end
          end
          object gbmulta: TGroupBox
            Left = 403
            Top = 8
            Width = 158
            Height = 93
            TabOrder = 1
            object lbmulta: TLabel
              Left = 10
              Top = 20
              Width = 123
              Height = 13
              Caption = 'Valor da Mora/Dia ou'
            end
            object Label6: TLabel
              Left = 10
              Top = 35
              Width = 77
              Height = 13
              Caption = 'Taxa Mensal:'
            end
            object redtValorMora: TRealEdit
              Left = 10
              Top = 56
              Width = 133
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 3
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 415
    Width = 599
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnSair: TBitBtn
        ModalResult = 3
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 555
    Top = 507
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
