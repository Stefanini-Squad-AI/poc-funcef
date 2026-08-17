inherited frmCadAvisoImob: TfrmCadAvisoImob
  Left = 52
  Top = 37
  HelpContext = 640086
  Caption = 'Parâmetros - Quadro de Avisos'
  ClientHeight = 457
  ClientWidth = 648
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 648
    Height = 371
    inherited pnlMestre: TPanel
      Width = 646
      Height = 50
      inline MolUsuario1: TMolUsuario
        Left = 13
        Top = 4
        Width = 484
        inherited edtUsuario: TEdit
          Width = 409
        end
        inherited btnBuscaUsuario: TBitBtn
          Left = 416
        end
        inherited btnLimpaUsuario: TBitBtn
          Left = 440
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 51
      Width = 646
      Height = 319
      Tabs.Strings = (
        'Parâmetros'
        'Visualizar Usuários')
      detdbGrids.Strings = (
        ''
        'dbgrdDet')
      inherited pgctrlDetalhe: TPageControl
        Width = 548
        Height = 260
        ActivePage = tbsParam
        object tbsParam: TTabSheet [0]
          Caption = 'Parâmetros'
          ImageIndex = 1
          object GroupBox7: TGroupBox
            Left = 24
            Top = -1
            Width = 369
            Height = 208
            Caption = 'Gerar aviso na ocorrência dos eventos  '
            TabOrder = 0
            object DBCheckBox31: TDBCheckBox
              Left = 16
              Top = 23
              Width = 241
              Height = 17
              Caption = 'Encerramento de Contrato de Locação'
              DataField = 'FLGENCERALUG'
              DataSource = ds
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox32: TDBCheckBox
              Left = 16
              Top = 46
              Width = 241
              Height = 17
              Caption = 'Revisão do Contrato de Locação'
              DataField = 'FLGREVISALUG'
              DataSource = ds
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox33: TDBCheckBox
              Left = 16
              Top = 92
              Width = 241
              Height = 17
              Caption = 'Reajuste do Contrato de Locação'
              DataField = 'FLGREAJUALUG'
              DataSource = ds
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox34: TDBCheckBox
              Left = 16
              Top = 138
              Width = 281
              Height = 17
              Caption = 'Vencimento da Apólice de Seguro do imóvel'
              DataField = 'FLGENCERSEGU'
              DataSource = ds
              TabOrder = 4
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox35: TDBCheckBox
              Left = 16
              Top = 115
              Width = 289
              Height = 17
              Caption = 'Vencimento da Fiança do Contrato de Locação'
              DataField = 'FLGVENCIFIAN'
              DataSource = ds
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox1: TDBCheckBox
              Left = 16
              Top = 69
              Width = 265
              Height = 17
              Caption = 'Renovatória de Contrato de Locação'
              DataField = 'FLGRENOVALUG'
              DataSource = ds
              TabOrder = 5
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox2: TDBCheckBox
              Left = 16
              Top = 180
              Width = 225
              Height = 17
              Caption = 'Eventos Programados'
              DataField = 'FLGAVISOEVENTO'
              DataSource = ds
              TabOrder = 6
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox3: TDBCheckBox
              Left = 16
              Top = 159
              Width = 281
              Height = 17
              Caption = 'Pagamento de Parcelamento'
              DataField = 'FLGPGTOPARC'
              DataSource = ds
              TabOrder = 7
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
          object GroupBox1: TGroupBox
            Left = 391
            Top = -1
            Width = 105
            Height = 208
            Caption = 'Antecedência'
            TabOrder = 1
            object Label1: TLabel
              Left = 69
              Top = 26
              Width = 24
              Height = 13
              Caption = 'dias'
            end
            object Label2: TLabel
              Left = 69
              Top = 50
              Width = 24
              Height = 13
              Caption = 'dias'
            end
            object Label3: TLabel
              Left = 69
              Top = 74
              Width = 24
              Height = 13
              Caption = 'dias'
            end
            object Label4: TLabel
              Left = 69
              Top = 98
              Width = 24
              Height = 13
              Caption = 'dias'
            end
            object Label5: TLabel
              Left = 69
              Top = 122
              Width = 24
              Height = 13
              Caption = 'dias'
            end
            object Label6: TLabel
              Left = 69
              Top = 146
              Width = 24
              Height = 13
              Caption = 'dias'
            end
            object Label7: TLabel
              Left = 69
              Top = 170
              Width = 24
              Height = 13
              Caption = 'dias'
            end
            object wwDBSpinEdit2: TwwDBSpinEdit
              Left = 14
              Top = 17
              Width = 51
              Height = 21
              Increment = 1
              MaxValue = 1000
              DataField = 'DIAENCERALUG'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object wwDBSpinEdit1: TwwDBSpinEdit
              Left = 14
              Top = 41
              Width = 51
              Height = 21
              Increment = 1
              MaxValue = 1000
              DataField = 'DIAREVISALUG'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
            end
            object wwDBSpinEdit3: TwwDBSpinEdit
              Left = 14
              Top = 65
              Width = 51
              Height = 21
              Increment = 1
              MaxValue = 1000
              DataField = 'DIARENOVALUG'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
            end
            object wwDBSpinEdit4: TwwDBSpinEdit
              Left = 14
              Top = 89
              Width = 51
              Height = 21
              Increment = 1
              MaxValue = 1000
              DataField = 'DIAREAJUALUG'
              DataSource = ds
              TabOrder = 3
              UnboundDataType = wwDefault
            end
            object wwDBSpinEdit5: TwwDBSpinEdit
              Left = 14
              Top = 113
              Width = 51
              Height = 21
              Increment = 1
              MaxValue = 1000
              DataField = 'DIAVENCIFIAN'
              DataSource = ds
              TabOrder = 4
              UnboundDataType = wwDefault
            end
            object wwDBSpinEdit6: TwwDBSpinEdit
              Left = 14
              Top = 137
              Width = 51
              Height = 21
              Increment = 1
              MaxValue = 1000
              DataField = 'DIAENCERSEGU'
              DataSource = ds
              TabOrder = 5
              UnboundDataType = wwDefault
            end
            object wwDBSpinEdit7: TwwDBSpinEdit
              Left = 14
              Top = 161
              Width = 51
              Height = 21
              Increment = 1
              MaxValue = 1000
              DataField = 'DIAPGTOPARC'
              DataSource = ds
              TabOrder = 6
              UnboundDataType = wwDefault
            end
          end
          object DBCheckBox30: TDBCheckBox
            Left = 24
            Top = 211
            Width = 377
            Height = 17
            Caption = 'Gerar aviso de contratos sem responsável definido'
            DataField = 'FLGRESPONSAVEL'
            DataSource = ds
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Visualizar Usuários'
          inherited pnlControlesDet: TPanel
            Width = 540
            Height = 232
            inline MolUsuario2: TMolUsuario
              Left = 48
              Top = 48
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 540
            Height = 232
            Selected.Strings = (
              'NOMEUSUARIO'#9'21'#9'Login'
              'NOME'#9'60'#9'Nome do Usuário')
          end
        end
      end
      inherited Dock973: TDock97
        Width = 638
      end
      inherited Dock974: TDock97
        Left = 552
        Height = 260
      end
    end
  end
  inherited Dock972: TDock97
    Width = 648
  end
  inherited Dock971: TDock97
    Top = 418
    Width = 648
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'U.NOMEUSUARIO'
      'P.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Login'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'AVISOIMOB A'
      'USUARIOSISTEMA U'
      'PESSOA P')
    CamposChave.Strings = (
      'A.IDUSUARIO')
    Filtro.Strings = (
      'A.IDUSUARIO = U.IDUSUARIO'
      'U.IDUSUARIO = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '20'
      '60')
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsAvisoImobxUsu
  end
  object cdsAvisoImobxUsu: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 563
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT U.IDUSUARIO, U.NOMEUSUARIO,   P.NOME'
      
        '  FROM USUARIOSISTEMA U, PESSOA P                               ' +
        '    '
      ' WHERE U.IDUSUARIO = P.IDPESSOA'
      ' ORDER BY U.NOMEUSUARIO')
    Left = 501
    Top = 68
  end
end
