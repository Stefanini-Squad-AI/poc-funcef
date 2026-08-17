inherited frmCadAtivos: TfrmCadAtivos
  Left = 186
  Top = 207
  HelpContext = 545015
  Caption = 'Cadastro de Ativos'
  ClientHeight = 243
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 157
    inherited dbGrd: TwwDBGrid [0]
      Height = 155
      Selected.Strings = (
        'DESCRICAO'#9'64'#9'Descrição')
    end
    inherited pnlControles: TPanel [1]
      Height = 155
      object Label1: TLabel
        Left = 96
        Top = 26
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label2: TLabel
        Left = 96
        Top = 82
        Width = 73
        Height = 13
        Caption = 'Carteira SPC'
      end
      object edDescricao: TwwDBEdit
        Left = 96
        Top = 40
        Width = 313
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object cbCarteiraSPC: TCMDBLookupCombo
        Left = 96
        Top = 96
        Width = 313
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCARTEIRASPC'#9'60'#9'Descrição'#9'F')
        DataField = 'IDCARTEIRASPC'
        DataSource = ds
        LookupTable = CdsCarteiraSPC
        LookupField = 'IDCARTEIRASPC'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 204
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 880
    Top = 56
  end
  inherited ds: TwwDataSource
    Left = 248
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 952
    Top = 56
  end
  inherited CmeCadastro: TCmEventosCadastro
    OpenDsAutomatico = True
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 320
    Top = 16
  end
  inherited Cds: TCMClientDataSet
    Left = 280
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 376
    Top = 0
  end
  object CdsCarteiraSPC: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 80
    Data = {
      DE0200009619E0BD010000001800000004000B0000000300000094000D494443
      4152544549524153504308000400000000000E44455343415254454952415350
      430100490000000100055749445448020002003C000B434F445345474D454E54
      4F08000400000000000B434F445449504F434152540100490000000100055749
      4454480200020005000100044C43494404000100090800000040000000000000
      F03F16436172746569726120646520416C746F20526973636F000000000000F0
      3F0040000000000000004017436172746569726120646520426169786F205269
      73636F000000000000F03F004000000000000008401C43617274656972612064
      652041E7F5657320656D204D65726361646F0000000000000040004000000000
      00001C401C436172746569726120646520416C756775E9697320652052656E64
      6100000000000008400040000000000000104019436172746569726120646520
      506172746963697061E7F565730000000000000040004000000000000014402A
      43617274656972612064652052656E64612056617269E176656C202D204F7574
      726F7320417469766F730000000000000040004000000000000018401B436172
      746569726120646520446573656E766F6C76696D656E746F0000000000000840
      004000000000000020401E43617274656972612064652046756E646F7320496D
      6F62696C69E172696F0000000000000840004000000000000022402D43617274
      65697261206465204F7574726F7320496E76657374696D656E746F7320496D6F
      62696C69E172696F730000000000000840004000000000000024403443617274
      6569726120646520456D7072E97374696D6F732061205061727469636970616E
      74657320652041737369737469646F7300000000000010400040000000000000
      26403743617274656972612064652046696E616E6369616D656E746F7320496D
      6F62696C69E172696F732061205061727469636970616E746573000000000000
      1040}
  end
end
