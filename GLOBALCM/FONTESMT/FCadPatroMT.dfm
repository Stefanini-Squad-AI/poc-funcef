inherited frmCadPatroMT: TfrmCadPatroMT
  Left = 70
  Top = 264
  Caption = 'Cadastro de Patrocinadora'
  ClientHeight = 569
  ClientWidth = 1138
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1138
    Height = 483
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 104
      Width = 1136
      Height = 378
      inherited pgctrlDetalhe: TPageControl
        Width = 1038
        Height = 319
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 1030
            Height = 291
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 1030
            Height = 291
            inherited pnlItemsDoc: TPanel
              Height = 289
            end
            inherited pnlFoto: TPanel
              Width = 540
              Height = 289
              inherited BvlImagem: TBevel
                Height = 258
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 258
                Width = 540
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 538
                Height = 258
              end
            end
            inherited lstDocumentos: TListView
              Height = 289
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 1030
            Height = 291
            inherited grpTipoEnd: TGroupBox
              Left = 833
              Height = 291
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 1030
            Height = 291
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited SplContatos_Padrao: TSplitter
            Left = 801
            Height = 291
          end
          inherited Panel1: TPanel
            Width = 801
            Height = 291
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 801
            Height = 291
          end
          inherited PnlContatol_Padrao: TPanel
            Left = 804
            Height = 291
            inherited GrdExibeContatos_Padrao: TwwDBGrid
              Height = 278
            end
          end
        end
        inherited tbsContato: TTabSheet
          inherited SplTelefones_Padrao: TSplitter
            Left = 828
            Height = 291
          end
          inherited Panel2: TPanel
            Width = 828
            Height = 291
          end
          inherited dbgContato: TwwDBGrid
            Width = 828
            Height = 291
          end
          inherited PnlTelefones_Padrao: TPanel
            Left = 831
            Height = 291
            inherited GrdTelefones_Padrao: TwwDBGrid
              Height = 278
            end
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 1030
            Height = 291
          end
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 1030
            Height = 291
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1128
      end
      inherited Dock974: TDock97
        Left = 1042
        Height = 319
      end
    end
    inherited pnlMestre: TPanel
      Width = 1136
      Height = 103
      inherited lblPdGrupo: TLabel
        Visible = False
      end
      object Label2: TLabel [6]
        Left = 783
        Top = 10
        Width = 86
        Height = 13
        Caption = 'Código de SPC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeSPC: TDBEdit
        Left = 783
        Top = 23
        Width = 137
        Height = 21
        DataField = 'CodSPC'
        DataSource = dsSubTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1138
  end
  inherited Dock971: TDock97
    Top = 530
    Width = 1138
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome da patrocinadora')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PATRO'
      'PESSOA')
    CamposChave.Strings = (
      'PATRO.IDPESSOA')
    Filtro.Strings = (
      'PATRO.IDPESSOA  = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '-1')
  end
  inherited MSGrupo: TMontaSelect
    SensivelACaixa.Strings = (
      'N'
      'N')
    OperComparador.Strings = (
      '-1'
      '-1')
  end
end
