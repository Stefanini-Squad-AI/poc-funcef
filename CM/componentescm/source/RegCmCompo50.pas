{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit RegCmCompo50;

interface

Uses Classes, DsgnIntf, Sysutils, Db, DbTables, Forms, wwTable, wwQuery,
     ColnEdit, Controls, windows{, BDEReg};

Type
  //Gimp
  TCMDatabaseNameProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TCMPorta_ImpressoraProperty = class(TStringProperty)
    public
      procedure Edit; override;
      function GetAttributes: TPropertyAttributes; override;
  end;

  //MontaSelect
  TMontaEditor = class(TDefaultEditor)
  protected
    procedure EditProperty(PropertyEditor: TPropertyEditor;
      var Continue, FreeEditor: Boolean); override;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TParamsProperty = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TCMFieldProperty = class(TStringProperty)
     function GetAttributes: TPropertyAttributes; override;
     procedure GetValues(Proc : TGetStrProc); override;
  end;

  TCMLookupFieldProperty = class(TStringProperty)
     function GetAttributes: TPropertyAttributes; override;
     procedure GetValues(Proc : TGetStrProc); override;
  end;

  TCMLookupParamProperty = class(TStringProperty)
     function GetAttributes: TPropertyAttributes; override;
     procedure GetValues(Proc : TGetStrProc); override;
  end;

  TcmTableNameProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TCmParamEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TCmListDialogEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TCmSqlParamsEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

procedure Register;

implementation

Uses
  CmDataBase, MahlpBtn, uExtensoCM, Pessoa, uTeclado, uGimp,
  uProcuraDir, BrowseFolder, CMDBLookupCombo, MontaSelect,
  MsParamsEditor, MsDataBaseSetings, CmDock, uProcuraFO,
  EditReg, TreeWzd, CmProcura, CmProcuraMask,
  CmProcuraSubTipo, CMSQLScript, CorreioCM, TREdit,
  CMDateTimePicker, TabControlDetalhe, Machklb, MskEdDlg, CmFtp, CMDataTransf,
  CmParamReport, fSelReportParam, uValidaDoc, CMDbListView, CmEventosCadastro,
  uParamsLib, CmErroDialiog, CMApplicationEvents, uCmRptManager, uCMClientDataSet,
  uCMTreeViewMT, CMTree, uCMListDialog, uCMSqlParams, Dialogs,
  MsFMontaSelect;


function TCMDatabaseNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList, paRevertable];
end;

procedure TCMDatabaseNameProperty.GetValues(Proc: TGetStrProc);
var
  list: TStringList;
  i: Integer;
begin
  list := TStringList.Create;
  Session.GetDatabaseNames(list);

  for i := 0 to list.Count - 1 do
    Proc(list[i]);

  list.Free;
end;

procedure TCMPorta_ImpressoraProperty.Edit;
var
  lDirDlg: TProcuraDirDlg;
begin
  lDirDlg         := TProcuraDirDlg.Create(Application);
  lDirDlg.Options := [bfBrowseForPrinter];
  lDirDlg.Folder  := foCustom;
  lDirDlg.Caption := 'Impressoras Compartilhadas';
  lDirDlg.Title  := 'Selecione um Impressora ou Digite a Porta Para Impressão';

  try
    if lDirDlg.Execute then SetValue(lDirDlg.Directory);
  finally
    lDirDlg.Free;
  end;
end;

function TCMPorta_ImpressoraProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

{ TParams }
{ TParamsProperty }
procedure TParamsProperty.Edit;
var ParamsMontaEditor : TfrmMSParamsEditor;
    TempMonta : TMontaSelect;
begin
     ParamsMontaEditor := TfrmMSParamsEditor.Create(Application);
     TempMonta := TMontaSelect(GetComponent(0));
     try
        ParamsMontaEditor.Componente := TempMonta;
        ParamsMontaEditor.ShowModal;
     finally
            ParamsMontaEditor.Free;
            Modified;
     end;
end;


function TParamsProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

{TMontaEditor}
procedure TMontaEditor.EditProperty(PropertyEditor: TPropertyEditor;
  var Continue, FreeEditor: Boolean);
var
  PropName: string;
begin
  PropName := PropertyEditor.GetName;
  if (CompareText(PropName, 'PARAMS') = 0) then
  begin
    PropertyEditor.Edit;
    Continue := False;
  end;
end;

function TMontaEditor.GetVerbCount: Integer;
begin

  Result := 2;
end;

function TMontaEditor.GetVerb(Index: Integer): string;
begin
  Case Index of
    0:  Result := 'Parâmetros';

    1:  Result := 'Executar';
    else Result := '';
  End;
end;

procedure TMontaEditor.ExecuteVerb(Index: Integer);
begin

  case Index of
    0: Edit;
    1: begin
      if (Component is TMontaSelect) and
         (TMontaSelect(Component) <> nil) then
        TMontaSelect(Component).Executar;
    end;
  end;
end;


Function TCMFieldProperty.GetAttributes: TPropertyAttributes;
begin
   result:= [paValueList, paSortList];
end;

procedure TCMFieldProperty.GetValues(Proc : TGetStrProc);
var
    ds: TDataSource;
    i: integer;
begin
   ds:= (GetComponent(0) as TCMCustomProcuraMask).dataSource;
   if (ds<>Nil) and (ds.dataSet<>Nil) then begin
     with ds.DataSet do begin
        for i:= 0 to fieldCount-1 do begin
           if (fields[i].dataType = ftBlob) or (fields[i].dataType=ftGraphic) or
              (fields[i].dataType = ftVarBytes) or (fields[i].dataType=ftBytes) then
              continue;
           Proc(fields[i].FieldName);
        end
     end;
   end
end;

Function TCMLookupFieldProperty.GetAttributes: TPropertyAttributes;
begin
   result:= [paValueList, paSortList];
end;

procedure TCMLookupFieldProperty.GetValues(Proc : TGetStrProc);
var
    ds: TDataSet;
    i: integer;
    List: TStrings;
    t: TwwTable;
    pm: TCMSqlParams;
begin
   List := TStringList.Create;
   t := TwwTable.Create(TComponent(GetComponent(0)));
   pm := nil;

   if (GetComponent(0) is TCMProcuraMask) then
   Begin
      ds := (GetComponent(0) as TCMProcuraMask).LookupQuery;
      pm := (GetComponent(0) as TCMProcuraMask).LookupSQLParams;
   End
   else
     if (GetComponent(0) is TCMCustomProcura) then
     begin
          t.databasename := (GetComponent(0) as TCMProcura).DataBaseName;
          t.TableName := (GetComponent(0) as TCMProcura).LookupTabela;
          ds := t;
     end
     else
         exit;

   If pm <> nil Then pm.Open;

   if (ds<>Nil) then
   begin
        ds.GetFieldNames(List);
        for i:= 0 to List.Count-1 do
            Proc(List[i]);

        If ds.Active Then ds.Close;
   end;

   List.free;
   t.free;
end;

Function TCMLookupParamProperty.GetAttributes: TPropertyAttributes;
begin
   result:= [paValueList, paSortList];
end;

procedure TCMLookupParamProperty.GetValues(Proc : TGetStrProc);
var
    ds: TDataSet;
    Pm: TCMSqlParams;
    i: integer;
begin
   if (GetComponent(0) is TCMProcuraMask) then
   Begin
      ds := (GetComponent(0) as TCMProcuraMask).LookupQuery;
      Pm := (GetComponent(0) as TCMProcuraMask).LookupSQLParams;
   End
   else
       exit;

   If Pm <> nil Then
   Begin
     For i:=0 To pm.ParamCount - 1 Do
        Proc(pm.Params[i].Name);
   end
   else
     if (ds<>Nil) And (ds is TwwQuery) then
       with ds do
          for i:= 0 to TwwQuery(ds).ParamCount-1 do
             Proc(TwwQuery(ds).Params[i].Name);
end;

{ TCMTableNameProperty }
function TCMTableNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList, paRevertable];
end;

procedure TCMTableNameProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
  list: TStringList;
begin
     list := TStringList.Create;
     if (GetComponent(0) is TCMCustomProcura) then
        Session.GetTableNames( (GetComponent(0) as TCMProcura).DatabaseName,
                             '', false, False, list);

     for i := 0 to list.Count - 1 do
         Proc(list[i]);
     list.Free;
end;

{ TCmParamEditor }

procedure TCmParamEditor.ExecuteVerb(Index: Integer);
Var
  DbInt :TDataBase;
begin
  DbInt := nil;
                                                               
  Case Index of
    0: ShowCollectionEditor(Designer, Component, TCmParamReport(Component).Params , 'Params');
    1: TCmParamReport(Component).Execute;
    2:
    Begin
       with TFrmSelReportParam.Create(Application) Do
       Begin
           Try
             TCmParamReport(Component).bUsaDataBaseName := False;

             {$I CmDbSegur.inc}

             Caption := 'Carrega Parâmetros';

             If ShowModal = MrOk Then
                TCmParamReport(Component).LoadFromDataBase(StrToInt(TreeReports.SelectedNode.StringData),StrToInt(TreeReports.SelectedNode.StringData2));
           finally
             Free;
             DbInt.Free;
             TCmParamReport(Component).bUsaDataBaseName := True;
           End;
       End;
    End;
    3:
    Begin
       with TFrmSelReportParam.Create(Application) Do
           Try
             TCmParamReport(Component).bUsaDataBaseName := False;
             {$I CmDbSegur.inc}

             Caption := 'Salva Parâmetros';

             If ShowModal = MrOk Then
             Begin
                If Not ((csDesigning In TCmParamReport(Component).ComponentState) And
                        (Application.MessageBox(PChar('Confirma Gravação do Relatório ' + TreeReports.SelectedNode.Text +
                                                      (#13+#10) + ' Do Módulo ' +  CmbModulo.Text + '?'),'Salvando Parâmetros',Mb_YesNo + Mb_IconQuestion) = Id_No)) Then
                   TCmParamReport(Component).SaveToDataBase(StrToInt(TreeReports.SelectedNode.StringData),StrToInt(TreeReports.SelectedNode.StringData2));
             End;
           finally
             Free;
             DbInt.Free;
             TCmParamReport(Component).bUsaDataBaseName := False;
           End;
    End;
  End;

end;

function TCmParamEditor.GetVerb(Index: Integer): string;
begin
  Case Index of
    0: Result := 'Params';
    1: Result := 'Execute';
    2: Result := 'Load Data';
    3: Result := 'Save Data';
  End;
end;

function TCmParamEditor.GetVerbCount: Integer;
begin
  Result := 4;
end;

{ Register }
procedure Register;
begin
  RegisterComponents('CM Standard', [TExtensoCM, TmaHelpBitBtn, TTeclado,
                     TTecladoPesquisa, TgImp, TEditReg,
                     TTreeWzd, TCorreioCM, TRealEdit, TCMchklistbox,
                     TcmMaskEditDlg, TCMFTP, TCmErroDialiog, TCMApplicationEvents]);


  RegisterComponents('CM Data Components', [TCMDatabase, TCMSQLScript, TMontaSelect,
                      TCMDBLookupCombo, TProcuraDlg, TCMProcuraMask,
                      TCMProcuraMaskContabil, TCMProcura, TCMProcuraSubTipo,
                      TCMProcuraForCli, TCMTreeView, TDBRealEdit, TCMDateTimePicker,
                      TTabControlDetalhe, TCMDbListView, TCMParams, TCMClientDataSet, TwwQuery, TUpdateSQL,
                      TCMTreeViewMT, TCMSqlParams]);

  RegisterComponents('CM Bussines', [TPessoa, TCMDataTransf, TCMValidaDoc]);

  RegisterComponents('CM Forms', [TCMOkCancelar, TCmParamReport, TCmEventosCadastro, TCmRptManager, TCMListDialog]);

  //TCmParamReport
  RegisterComponentEditor(TCmParamReport, TCmParamEditor);

  //TCMListDialog
  RegisterComponentEditor(TCMListDialog, TCmListDialogEditor);

  //TCMSqlParams
  RegisterComponentEditor(TCMSqlParams, TCmSqlParamsEditor);

  //GImp
  RegisterPropertyEditor(TypeInfo(String),
                         TgImp, 'DataBaseName', TCMDataBaseNameProperty);

  RegisterPropertyEditor(TypeInfo(String),
                         TgImp, 'Porta_Impressora', TCMPorta_ImpressoraProperty);

  RegisterPropertyEditor(TypeInfo(String),
                         TCmRptManager, 'DataBaseName', TCMDataBaseNameProperty);

  //TCMDataTransf
  RegisterPropertyEditor(TypeInfo(String),
                         TCMDataTransf, 'DataBaseName', TCMDataBaseNameProperty);


  //MontaSelect
  RegisterComponentEditor(TMontaSelect, TMontaEditor);
  RegisterPropertyEditor(TypeInfo(TParams), TMontaSelect, 'Params', TParamsProperty);
  RegisterPropertyEditor(TypeInfo(TParams), TMsTemplate, 'DataBaseSettings', TMsDataBaseSettings);

  RegisterPropertyEditor(TypeInfo(String),
                         TCMProcuraMask, 'DataField', TCMFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),
                         TCMProcuraMask, 'LookupChave', TCMLookupFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),
                         TCMProcuraMask, 'LookupTipo', TCMLookupFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),
                         TCMProcuraMask, 'LookupDescricao', TCMLookupFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),
                         TCMProcuraMask, 'LookupParam', TCMLookupParamProperty);
  // CMProcura
  RegisterPropertyEditor(TypeInfo(String),
                         TCMCustomProcura, 'LookupChave', TCMLookupFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),
                         TCMCustomProcura, 'LookupDescricao', TCMLookupFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),
                         TCMCustomProcura, 'DataBaseName', TCMDataBaseNameProperty);
  RegisterPropertyEditor(TypeInfo(String),
                         TCMCustomProcura, 'LookupTabela', TCMTableNameProperty);

  RegisterPropertyEditor(TypeInfo(String),
                         TMontaSelect, 'DataBaseName', TCMDataBaseNameProperty);
  // CMSQLScript
  RegisterPropertyEditor(TypeInfo(String),
                         TCMSQLScript, 'DataBaseName', TCMDataBaseNameProperty);

  RegisterPropertyEditor(TypeInfo(String),
                         TCmParamReport, 'DataBaseName', TCMDataBaseNameProperty);

  
end;

{ TCmListDialogEditor }

procedure TCmListDialogEditor.ExecuteVerb(Index: Integer);
begin
  inherited;
  If Index = 0 Then
     TCMListDialog(Component).Execute;
end;

function TCmListDialogEditor.GetVerb(Index: Integer): string;
begin
  If Index = 0 Then Result := 'Execute';
end;

function TCmListDialogEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

{ TCmSqlParamsEditor }

procedure TCmSqlParamsEditor.ExecuteVerb(Index: Integer);
begin
  inherited;
  Case Index Of
    0: TCMSqlParams(Component).Open;
    1: If TCMSqlParams(Component).ClientDataSet.Active Then TCMSqlParams(Component).ClientDataSet.Close;
    2: ShowMessage(TCMSqlParams(Component).SQLChanged);
  End;
end;

function TCmSqlParamsEditor.GetVerb(Index: Integer): string;
begin
  Case Index of
    0: Result := 'Open';
    1: Result := 'Close';
    2: Result := 'Show SQLChanged';
  End;
end;

function TCmSqlParamsEditor.GetVerbCount: Integer;
begin
  Result := 3;
end;

end.
