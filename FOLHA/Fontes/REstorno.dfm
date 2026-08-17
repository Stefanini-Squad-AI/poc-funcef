inherited RptEstorno: TRptEstorno
  Left = 180
  Top = 226
  Width = 207
  Height = 275
  Caption = 'Relatório de Estorno'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Estorno'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Patrocinadora'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'select   PE.IDPESSOA, PE.NOME'
          'from     PESSOA PE, PATRO PA'
          'where    PE.IDPESSOA = PA.IDPESSOA'
          'order by PE.NOME')
        LookupSettings.Chave = 'IDPESSOA'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Patrocinadora'
        LookupSettings.Tamanho = '30'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = True
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Patrocinadora'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Versão'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'select HISTORICO, '
          ' IDHSTFOLHABENEF'
          'from HSTFOLHABENEF'
          'where FLGESTADO <> 2'
          'order by 2 desc')
        LookupSettings.Chave = 'IDHSTFOLHABENEF'
        LookupSettings.Display = 'HISTORICO'
        LookupSettings.Descricao = 'Versão'
        LookupSettings.Tamanho = '30'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Versão'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Plano'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'select   IDPLANOPREV,'
          '         NOME'
          'from     PLANPREV')
        LookupSettings.Chave = 'IDPLANOPREV'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Plano'
        LookupSettings.Tamanho = '30'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Plano'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Nome do Titular'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Nome do Titular'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Inscrição'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Inscrição'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Matrícula'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Matrícula'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Nome do Recebedor'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Nome do Recebedor'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Data Inicial'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Data Inicial'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Data Final'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Data Final'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    HelpContext = 180105
    Left = 144
    Top = 16
  end
  inherited DevRptCM: TExtraOptions
    Top = 16
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    DataBaseName = 'BaseDados'
    Report = rptEstRub
    Left = 86
    Top = 16
  end
  object qryEstRub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PJ.NOME '#9#9#9#9#9#9#9#9#9#9#9#9#9'||'
      #9' PV.NOME '#9#9#9#9#9#9#9#9#9#9#9#9#9'||'
      '   E.MATRICULA '#9#9#9#9#9#9#9#9#9#9#9'||'
      #9' PR.NOME '#9#9#9#9#9#9#9#9#9#9#9#9#9'||'
      '   to_char( ME.IDHSTFOLHABENEF ) as GRUPO,'
      '   ME.IDHSTFOLHABENEF,'
      '   ME.IDPESSJUR,'
      '   ME.IDPLANOPREV,'
      '   ME.IDTITULAR,'
      '   ME.IDRECEBEDOR,'
      '   DECODE(ME.TIPOESTORNO,'
      '     0, '#39'ESTORNO COMPLETO DA FOLHA'#39','
      '     11, '#39'PAGAMENTO PENDENTE COM ALTERADOR (CAP NÃO BAIXADO)'#39','
      '     12, '#39'ESTORNO POR ERRO COM ALTERADOR (CAP NÃO BAIXADO)'#39','
      '     13, '#39'NOVO CAP COM ALTERADOR (CAP NÃO BAIXADO)'#39','
      '     14, '#39'REPROCESSAMENTO COM ALTERADOR (CAP NÃO BAIXADO)'#39','
      '     21, '#39'PAGAMENTO PENDENTE COM CAR (BANCO) (CAP BAIXADO)'#39','
      '     22, '#39'ESTORNO POR ERRO COM CAR (PAGADOR) (CAP BAIXADO)'#39','
      '     23, '#39'NOVO CAP COM CAR (PAGADOR) (CAP BAIXADO)'#39','
      '     24, '#39'REPROCESSAMENTO COM CAR (PAGADOR) (CAP BAIXADO)'#39','
      
        '     25, '#39'ALTERAÇÃO DA FORMA DE PAGAMENTO (DOCUMENTO COM ÚNICO R' +
        'ECEBEDOR)'#39') AS TIPOESTORNO,'
      '   ME.DATAESTORNO,'
      '   PJ.NOME as PATROCINADORA,'
      '   ME.MOTIVO,'
      '   PP.INSCRICAONUMERO,'
      '   E.MATRICULA,'
      '   PT.NOME as TITULAR,'
      '   PR.NOME as RECEBEDOR,'
      '   HF.HISTORICO,'
      '   PV.NOME as PLANO,'
      '   H.MES,'
      
        '   DECODE( PD.FLGESPECIAL, 0, DECODE( PD.FLGDESCONTO, 0, '#39'P'#39', 1,' +
        ' '#39'D'#39', '#39'I'#39' ), '#39'I'#39' ) AS ESTADO,'
      '   TO_CHAR(PD.IDPROVENTO) AS CODIGO,'
      '   PD.DESCRICAO AS RUBRICA,'
      
        '   DECODE(H.VALORPROVENTO,0,H.VALORINFO,H.VALORPROVENTO) AS VALO' +
        'R'
      'FROM'
      '   MOTIVOESTORNOFB ME,'
      '   PESSOA PJ,'
      '   PESSOA PT,'
      '   PESSOA PR,'
      '   PARTPREVPLAN PP,'
      '   ELEGPATRO E,'
      '   HSTFOLHABENEF HF,'
      '   PLANPREV PV,'
      '   HISTRUBSAL H,'
      '   PROVDESC PD'
      'WHERE 1 = 2 AND '
      '   ( ME.IDPESSJUR  '#9#9'  '#9'= PJ.IDPESSOA     '#9#9' ) AND'
      '   ( ME.IDTITULAR'#9#9#9'    = PP.IDPESSOA   '#9'  '#9' ) AND'
      '   ( ME.IDPLANOPREV'#9#9'   = PP.IDPLANOPREV '#9#9'  ) AND'
      '   ( ME.IDPESSJUR'#9#9'     = PP.IDPESSJUR  '#9#9'   ) AND'
      '   ( ME.IDTITULAR'#9#9#9'    = E.IDPESSOA     '#9#9'  ) AND'
      '   ( ME.IDPESSJUR'#9#9'     = E.IDPESSJUR    '#9#9'  ) AND'
      '   ( ME.IDTITULAR '#9#9'    = PT.IDPESSOA    '#9#9'  ) AND'
      '   ( ME.IDRECEBEDOR'#9#9'   = PR.IDPESSOA '#9#9#9'    ) AND'
      '   ( ME.IDHSTFOLHABENEF = HF.IDHSTFOLHABENEF ) AND'
      '   ( ME.IDPLANOPREV     = PV.IDPLANOPREV     ) AND'
      '   ( H.IDRUBRICA        = PD.IDPROVENTO      ) AND'
      '   ( H.IDPATRO          = ME.IDPESSJUR       ) AND'
      '   ( H.IDHSTFOLHABENEF  = ME.IDHSTFOLHABENEF ) AND'
      '   ( H.IDTITULAR        = ME.IDTITULAR       ) AND'
      '   ( H.IDRESPONSAVEL    = ME.IDRECEBEDOR     ) AND'
      '   ( H.IDPLANOPREV      = ME.IDPLANOPREV     )'
      'ORDER BY'
      '   GRUPO,'
      '   H.SEQRUBRICA'
      ''
      ''
      ''
      ''
      '')
    ControlType.Strings = (
      'MOTIVO;RichEdit;')
    ValidateWithMask = True
    Left = 20
    Top = 202
    object qryEstRubGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 223
    end
    object qryEstRubIDHSTFOLHABENEF: TFloatField
      FieldName = 'IDHSTFOLHABENEF'
    end
    object qryEstRubIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryEstRubIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryEstRubIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryEstRubIDRECEBEDOR: TFloatField
      FieldName = 'IDRECEBEDOR'
    end
    object qryEstRubTIPOESTORNO: TStringField
      FieldName = 'TIPOESTORNO'
      Size = 63
    end
    object qryEstRubDATAESTORNO: TDateTimeField
      FieldName = 'DATAESTORNO'
    end
    object qryEstRubPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object qryEstRubMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 200
    end
    object qryEstRubINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryEstRubMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryEstRubTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryEstRubRECEBEDOR: TStringField
      FieldName = 'RECEBEDOR'
      Size = 60
    end
    object qryEstRubHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object qryEstRubPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryEstRubMES: TStringField
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qryEstRubESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 1
    end
    object qryEstRubCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 40
    end
    object qryEstRubRUBRICA: TStringField
      FieldName = 'RUBRICA'
      Size = 130
    end
    object qryEstRubVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object ppEstRub: TppBDEPipeline
    DataSource = dtsEstRub
    UserName = 'EstRub'
    Left = 20
    Top = 115
  end
  object rptEstRub: TppReport
    AutoStop = False
    DataPipeline = ppEstRub
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 20
    Top = 72
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppEstRub'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41540
      mmPrintPosition = 0
      object ppDBImage17: TppDBImage
        UserName = 'DBImage17'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText165: TppDBText
        UserName = 'DBText165'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'ppLabel87'
        Caption = 'Relatório de Estornos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 76729
        mmTop = 31485
        mmWidth = 44186
        BandType = 0
      end
      object ppDBText76: TppDBText
        UserName = 'ppDBText76'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText77: TppDBText
        UserName = 'ppDBText77'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText78: TppDBText
        UserName = 'ppDBText78'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'ppDBText22'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'MES'
        DataPipeline = ppEstRub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEstRub'
        mmHeight = 3969
        mmLeft = 34396
        mmTop = 264
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CODIGO'
        DataPipeline = ppEstRub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstRub'
        mmHeight = 3969
        mmLeft = 53181
        mmTop = 264
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'RUBRICA'
        DataPipeline = ppEstRub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEstRub'
        mmHeight = 3969
        mmLeft = 70644
        mmTop = 265
        mmWidth = 82021
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'ESTADO'
        DataPipeline = ppEstRub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEstRub'
        mmHeight = 3969
        mmLeft = 156634
        mmTop = 264
        mmWidth = 7938
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'dbtValor'
        DataField = 'VALOR'
        DataPipeline = ppEstRub
        DisplayFormat = '#0.00;-#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstRub'
        mmHeight = 3969
        mmLeft = 171715
        mmTop = 264
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppCalc39: TppSystemVariable
        UserName = 'Calc39'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 9525
        mmWidth = 197644
        BandType = 8
      end
      object ppLabel90: TppLabel
        UserName = 'ppLabel90'
        AutoSize = False
        Caption = 'TotalPrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 9525
        mmWidth = 198173
        BandType = 8
      end
      object ppCalc40: TppSystemVariable
        UserName = 'ppCalc401'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 9525
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = ppEstRub
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEstRub'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 73025
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'PATROCINADORA'
          DataPipeline = ppEstRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEstRub'
          mmHeight = 3969
          mmLeft = 34396
          mmTop = 5821
          mmWidth = 154782
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'PLANO'
          DataPipeline = ppEstRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEstRub'
          mmHeight = 3969
          mmLeft = 34396
          mmTop = 16933
          mmWidth = 154782
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 5821
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 16933
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Versão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 11377
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Titular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 22490
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 28046
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Recebedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 33602
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Data do Estorno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 39158
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Motivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 51858
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'HISTORICO'
          DataPipeline = ppEstRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEstRub'
          mmHeight = 3969
          mmLeft = 34396
          mmTop = 11377
          mmWidth = 154782
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'TITULAR'
          DataPipeline = ppEstRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEstRub'
          mmHeight = 3969
          mmLeft = 34396
          mmTop = 22490
          mmWidth = 154782
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'INSCRICAONUMERO'
          DataPipeline = ppEstRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEstRub'
          mmHeight = 3969
          mmLeft = 34396
          mmTop = 28046
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'RECEBEDOR'
          DataPipeline = ppEstRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEstRub'
          mmHeight = 3969
          mmLeft = 34396
          mmTop = 33602
          mmWidth = 154782
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'DATAESTORNO'
          DataPipeline = ppEstRub
          DisplayFormat = 'mm / dd / yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEstRub'
          mmHeight = 3969
          mmLeft = 34396
          mmTop = 39423
          mmWidth = 41804
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo1: TppDBMemo
          UserName = 'DBMemo1'
          CharWrap = False
          DataField = 'MOTIVO'
          DataPipeline = ppEstRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEstRub'
          mmHeight = 13229
          mmLeft = 34396
          mmTop = 51858
          mmWidth = 154517
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 160338
          mmTop = 28046
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'MATRICULA'
          DataPipeline = ppEstRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEstRub'
          mmHeight = 3969
          mmLeft = 180182
          mmTop = 28046
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 4763
          mmTop = 72496
          mmWidth = 184415
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Mês Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 34396
          mmTop = 67998
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 53181
          mmTop = 67998
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Decrição da Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 70644
          mmTop = 67998
          mmWidth = 82021
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'P/D/I'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 156634
          mmTop = 67998
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 171715
          mmTop = 67998
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 3
          Weight = 2.25
          mmHeight = 1588
          mmLeft = 4763
          mmTop = 3704
          mmWidth = 184415
          BandType = 3
          GroupNo = 0
        end
        object lblTpEstorno: TppLabel
          UserName = 'lblTpEstorno'
          Caption = 'Tipo de Estorno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 44979
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText101'
          DataField = 'TIPOESTORNO'
          DataPipeline = ppEstRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEstRub'
          mmHeight = 3969
          mmLeft = 34396
          mmTop = 44979
          mmWidth = 154517
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 26988
        mmPrintPosition = 0
      end
    end
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT P.IDPESSOA, P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO' +
        ','
      '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO    ,'
      '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP       , I.IMAGEM,'
      '       (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDERECO   ,'
      '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND'
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 84
    Top = 202
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
      end>
    object qryFundacaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryFundacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryFundacaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryFundacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryFundacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryFundacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryFundacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryFundacaoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryFundacaoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFundacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object qryFundacaoBARCIDUF: TStringField
      FieldName = 'BARCIDUF'
      Size = 79
    end
  end
  object dtsEstRub: TwwDataSource
    DataSet = qryEstRub
    Left = 20
    Top = 158
  end
  object dtsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 84
    Top = 158
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dtsFundacao
    UserName = 'Fundacao'
    Left = 84
    Top = 115
  end
end
