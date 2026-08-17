unit FCadServContribass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, DBCtrls, Db,
  Wwdatsrc, DBTables, Wwquery, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmCadSevContribass = class(TfrmSairAjuda)
    DBLkpLstservRel: TDBLookupListBox;
    DBLkpLstserv: TDBLookupListBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    qryservrel: TwwQuery;
    qryserv: TwwQuery;
    dsservrel: TwwDataSource;
    dsserv: TwwDataSource;
    qryaux: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure qryservBeforeOpen(DataSet: TDataSet);
    procedure qryservrelBeforeOpen(DataSet: TDataSet);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure DBLkpLstservMouseDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: integer);
    procedure DBLkpLstservRelMouseDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    procedure DBLkpLstservDragOver(Sender, Source: TObject; X, Y: integer;
              State: TDragState; var Accept: boolean);
    procedure DBLkpLstservRelDragOver(Sender, Source: TObject; X, Y: integer;
              State: TDragState; var Accept: boolean);
    procedure DBLkpLstservDragDrop(Sender, Source: TObject; X, Y: integer);
    procedure DBLkpLstservRelDragDrop(Sender, Source: TObject; X, Y: integer);
  private
    { Private declarations }
  public
    { Public declarations }
    Selecionou : boolean;
  end;

var
  frmCadSevContribass: TfrmCadSevContribass;

implementation

uses FPlanass, UMensErro, UAdmAss;

{$R *.DFM}

procedure TfrmCadSevContribass.FormActivate(Sender: TObject);
begin
  inherited;
  qryservrel.open;
  qryserv.open;
  edit1.text :=  frmplanass.qrycontrib.fieldbyname('NOME').AsString+'/'+frmplanass.qryprinc.fieldbyname('NOME').AsString;
end;

procedure TfrmCadSevContribass.bbtnSairClick(Sender: TObject);
begin
  if qryservrel.isempty  then
  begin
     if msgdlg('Se o cálculo da contribuição é feito em vista do uso de serviços, é preciso selecionar que serviços devem ser levados em consideração. Deseja sair assim mesmo ?',
               'Assistencial', mtinformation ,[mbyes,mbno],0) = mrno then
     begin
        exit;
     end
     else
     begin
        selecionou := false;
     end;
  end
  else
    selecionou := true;
  inherited;
end;

procedure TfrmCadSevContribass.qryservBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryserv.parambyname('idplanass').AsInteger := frmplanass.qryprinc.fieldbyname('idplanass').AsInteger;
  qryserv.parambyname('idcontass').AsInteger := iidcontrib;
end;

procedure TfrmCadSevContribass.qryservrelBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryservrel.parambyname('idplanass').AsInteger := frmplanass.qryprinc.fieldbyname('idplanass').AsInteger;
  qryservrel.parambyname('idcontass').AsInteger := iidcontrib;
end;

procedure TfrmCadSevContribass.sbtnAssociaClick(Sender: TObject);
begin
  if qryserv.isempty then
    exit;

  inherited;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('INSERT INTO SERVCONTRIBASS(IDPLANASS,IDCONTASS,IDSERVASS) '+
                 'VALUES('+frmplanass.qryprinc.FieldByName('IdPlanass').AsString+','+
                         ''+inttostr(iidcontrib)+','+
                         ''+qryserv.FieldByName('IDservass').AsString+')');
  try
     qryAux.ExecSQL;
  except
  end;

  qryserv.close;
  qryserv.open;
  qryservrel.close;
  qryservrel.open;
end;

procedure TfrmCadSevContribass.sbtnAssociaTodosClick(Sender: TObject);
begin
   inherited;
   if qryserv.isempty then
   begin
      sbtnAssociaTodos.Down := false;
      exit;
   end;

   qryserv.first;

   while not qryserv.eof do
   begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('INSERT INTO SERVCONTRIBASS(IDPLANASS,IDCONTASS,IDSERVASS) '+
                     'VALUES('+frmplanass.qryprinc.FieldByName('IdPlanass').AsString+','+
                             ''+inttostr(iidcontrib)+','+
                             ''+qryserv.FieldByName('IDservass').AsString+')');
      try
         qryAux.ExecSQL;
      except
      end;
      qryserv.next;
   end;//while

   qryserv.close;
   qryserv.open;
   qryservrel.close;
   qryservrel.open;
end;

procedure TfrmCadSevContribass.sbtnDesassociaClick(Sender: TObject);
begin
   inherited;
   if qryservrel.isempty then
     exit;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('DELETE FROM  SERVCONTRIBASS'+
                  ' WHERE (IDPLANASS = '+frmplanass.qryprinc.FieldByName('IdPlanass').AsString+') AND '+
                        ' (IDCONTASS = '+inttostr(iidcontrib)+') AND '+
                        ' (IDSERVASS = '+qryservrel.FieldByName('IDservass').AsString+')');
   try
      qryAux.ExecSQL;
   except
   end;

   qryserv.close;
   qryserv.open;
   qryservrel.close;
   qryservrel.open;
end;

procedure TfrmCadSevContribass.sbtnDesassociaTodosClick(Sender: TObject);
begin
   inherited;
   if qryservrel.isempty then exit;

   qryservrel.first;
   while not qryservrel.eof do
   begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE FROM  SERVCONTRIBASS'+
                     ' WHERE (IDPLANASS = '+frmplanass.qryprinc.FieldByName('IdPlanass').AsString+') AND '+
                           ' (IDCONTASS = '+inttostr(iidcontrib)+') AND '+
                           ' (IDSERVASS = '+qryservrel.FieldByName('IDservass').AsString+')');
      try
         qryAux.ExecSQL;
      except
      end;
      qryservrel.next;
   end;//while

   qryserv.close;
   qryserv.open;
   qryservrel.close;
   qryservrel.open;
end;

procedure TfrmCadSevContribass.DBLkpLstservMouseDown(Sender: TObject; Button: TMouseButton;
          Shift: TShiftState; X, Y: integer);
begin
  inherited;
  TDBLookUplistBox(Sender).BeginDrag(true);
end;

procedure TfrmCadSevContribass.DBLkpLstservRelMouseDown(Sender: TObject; Button: TMouseButton;
          Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TfrmCadSevContribass.DBLkpLstservDragOver(Sender, Source: TObject; X, Y: Integer;
          State: TDragState; var Accept: boolean);
begin
  inherited;
  Accept := true;
end;

procedure TfrmCadSevContribass.DBLkpLstservRelDragOver(Sender, Source: TObject; X, Y: Integer;
          State: TDragState; var Accept: boolean);
begin
  inherited;
  Accept := true;
end;

procedure TfrmCadSevContribass.DBLkpLstservDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  if (Sender is TDBLookUpListBox) and (Source is TDBLookUpListBox) then
  begin
    TDBLookUpListBox(Source).EndDrag(true);

    if not (TDBLookUpListBox(Source).Name = ('DBLkpLstservRel')) then
      exit;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('DELETE FROM  SERVCONTRIBASS'+
                   ' WHERE (IDPLANASS = '+frmplanass.qryprinc.FieldByName('IdPlanass').AsString+') AND '+
                         ' (IDCONTASS = '+inttostr(iidcontrib)+') AND '+
                         ' (IDSERVASS = '+qryservrel.FieldByName('IDservass').AsString+')');
    try
       qryAux.ExecSQL;
    except
    end;

    qryserv.close;
    qryserv.open;
    qryservrel.close;
    qryservrel.open;
  end;//if
end;

procedure TfrmCadSevContribass.DBLkpLstservRelDragDrop(Sender, Source: TObject; X, Y: integer);
begin
  inherited;
  if (Sender is TDBLookUpListBox) and (Source is TDBLookUpListBox) then
  begin
    TDBLookUpListBox(Source).EndDrag(True);

    if not (TDBLookUpListBox(Source).Name = ('DBLkpLstserv')) then
      exit;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('INSERT INTO SERVCONTRIBASS(IDPLANASS,IDCONTASS,IDSERVASS) '+
                   'VALUES('+frmplanass.qryprinc.FieldByName('IdPlanass').AsString+','+
                           ''+inttostr(iidcontrib)+','+
                           ''+qryserv.FieldByName('IDservass').AsString+')');
    try
       qryAux.ExecSQL;
    except
    end;

    qryserv.close;
    qryserv.open;
    qryservrel.close;
    qryservrel.open;

  end;//if
end;

end.


