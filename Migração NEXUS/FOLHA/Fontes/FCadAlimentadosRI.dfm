inherited frmCadAlimentadosRI: TfrmCadAlimentadosRI
  Left = 139
  Top = 191
  BorderIcons = []
  Caption = 'Cadastro de Alimentados'
  ClientHeight = 452
  ClientWidth = 772
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 772
    Height = 366
    inherited pnlMestre: TPanel
      Width = 770
      Height = 72
      object Label4: TLabel
        Left = 8
        Top = 42
        Width = 72
        Height = 13
        Caption = 'Favorecido :'
      end
      object Label2: TLabel
        Left = 5
        Top = 10
        Width = 75
        Height = 13
        Caption = 'Alimentante :'
      end
      object edtNomeFavorecido: TEdit
        Left = 86
        Top = 39
        Width = 603
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtPrincipal: TEdit
        Left = 86
        Top = 7
        Width = 603
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 73
      Width = 770
      Height = 292
      inherited pgctrlDetalhe: TPageControl
        Width = 672
        Height = 233
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 664
            Height = 205
            Selected.Strings = (
              'NOME'#9'33'#9'Nome'
              'PERCENTUAL'#9'10'#9'Percentual'
              'IDADESAIDA'#9'12'#9'Idade de Saida'
              'FLGREDISTRIBUICAO'#9'18'#9'Redistribuir Percentual'
              'NUMDOCUMENTO'#9'18'#9'CPF')
          end
          inherited pnlControlesDet: TPanel
            Width = 664
            Height = 205
            object GroupBox1: TGroupBox
              Left = 4
              Top = 3
              Width = 593
              Height = 145
              Caption = 'Dados do Alimentado'
              TabOrder = 0
              object Label1: TLabel
                Left = 5
                Top = 25
                Width = 33
                Height = 13
                Caption = 'Nome'
              end
              object Label3: TLabel
                Left = 31
                Top = 62
                Width = 62
                Height = 13
                Caption = 'Percentual'
              end
              object Bevel1: TBevel
                Left = 6
                Top = 52
                Width = 581
                Height = 2
              end
              object Label5: TLabel
                Left = 399
                Top = 64
                Width = 89
                Height = 13
                Caption = 'Idade de Saída'
              end
              object Bevel2: TBevel
                Left = 6
                Top = 87
                Width = 581
                Height = 2
              end
              object dblkpcmbRubDesconto: TwwDBLookupCombo
                Left = 45
                Top = 22
                Width = 543
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'NOME'#9'F')
                DataField = 'IDALIMENTADO'
                DataSource = dsDet
                LookupTable = qryAlimentado
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object redPercentual: TRealEdit
                Left = 98
                Top = 60
                Width = 61
                Height = 20
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 1
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
              end
              object dbredistrribui: TDBCheckBox
                Left = 205
                Top = 61
                Width = 161
                Height = 17
                Caption = 'Redistribui o Percentual'
                DataField = 'FLGREDISTRIBUICAO'
                DataSource = dsDet
                TabOrder = 2
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEdit1: TDBEdit
                Left = 495
                Top = 60
                Width = 39
                Height = 21
                AutoSize = False
                DataField = 'IDADESAIDA'
                DataSource = dsDet
                MaxLength = 2
                TabOrder = 3
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 762
      end
      inherited Dock974: TDock97
        Left = 676
        Height = 233
      end
    end
  end
  inherited Dock972: TDock97
    Width = 772
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
        OnClick = nil
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 413
    Width = 772
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 256
    Top = 2
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 667
    Top = 10
  end
  inherited ds: TwwDataSource
    Left = 450
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  NOME = :OLD_NOME')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  NOME = :OLD_NOME')
    Left = 402
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'CPF')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'DEPENTIT'
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'DEPENTIT.IDTITULAR'
      'DEPENTIT.IDPESSOA')
    Filtro.Strings = (
      'DEPENTIT.IDTITULAR = 123'
      'PESSOA.IDPESSOA = DEPENTIT.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '18')
    Left = 499
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 305
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 508
    Top = 114
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      #9'PES.NOME'
      'FROM'
      #9'PESSOA PES'
      'WHERE '
      #9'PES.IDPESSOA = :IIDPESSOA'
      ' ')
    Left = 361
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Operacao = opIdle
    Left = 588
    Top = 114
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      '      FXA.IDTITULAR,'
      '      FXA.IDFAVORECIDO,'
      '      FXA.IDALIMENTADO,'
      '      FXA.PERCENTUAL,'
      '      FXA.FLGREDISTRIBUICAO,'
      '      FXA.IDADESAIDA,'
      '      PES.NOME,'
      '      PES.NUMDOCUMENTO'
      'from'
      '    FAVORECXALIMENTADOS FXA,'
      '    PESSOA PES'
      'where'
      '     FXA.IDFAVORECIDO = :IIDFAVORECIDO AND'
      '     PES.IDPESSOA = FXA.IDALIMENTADO'
      ''
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGREDISTRIBUICAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 561
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IIDFAVORECIDO'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update FAVORECXALIMENTADOS'
      'set'
      '  PERCENTUAL = :PERCENTUAL,'
      '  FLGREDISTRIBUICAO = :FLGREDISTRIBUICAO,'
      '  IDADESAIDA = :IDADESAIDA'
      'where'
      '  IDFAVORECIDO = :OLD_IDFAVORECIDO and'
      '  IDALIMENTADO = :OLD_IDALIMENTADO and'
      '  IDTITULAR = :OLD_IDTITULAR')
    InsertSQL.Strings = (
      'insert into FAVORECXALIMENTADOS'
      '  (IDTITULAR,IDFAVORECIDO,IDALIMENTADO,PERCENTUAL, '
      'FLGREDISTRIBUICAO,IDADESAIDA)'
      'values'
      '  (:IDTITULAR,:IDFAVORECIDO,:IDALIMENTADO,:PERCENTUAL, '
      ':FLGREDISTRIBUICAO,:IDADESAIDA)')
    DeleteSQL.Strings = (
      'delete from FAVORECXALIMENTADOS'
      'where'
      '  IDFAVORECIDO = :OLD_IDFAVORECIDO and'
      '  IDALIMENTADO = :OLD_IDALIMENTADO and'
      '  IDTITULAR = :OLD_IDTITULAR')
    Left = 610
    Top = 2
  end
  object qryAlimentado: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      PES.IDPESSOA,'
      '      PES.NOME,'
      '      DEP.IDDEPENDENCIA,'
      '      PSF.DATANASC'
      'FROM'
      '      PESSOA PES,'
      '      DEPENTIT DEP,'
      '      PESSOAFISICA PSF'
      'WHERE'
      '     DEP.IDTITULAR  = :IIDTITULAR AND'
      '     PES.IDPESSOA = DEP.IDPESSOA  AND'
      '     DEP.IDDEPENDENCIA <> '#39'PRP'#39'   AND'
      '     PSF.IDPESSOA = DEP.IDPESSOA'
      'ORDER BY DEP.IDDEPENDENCIA'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 221
    Top = 122
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IIDTITULAR'
        ParamType = ptUnknown
      end>
  end
end
