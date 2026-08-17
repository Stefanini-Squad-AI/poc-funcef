// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 16.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FCadEeventoxSit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  ComCtrls, Db, DBTables, Wwquery, DBCtrls, Wwdatsrc, UMensErro, IvDictio,
  IvMulti, IvEMulti, ImgList;

type
  TFrmCadEeventoxSit = class(TfrmOkCancelar)
    pnlevento: TPanel;
    Label1: TLabel;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    tbsitfunc: TTabSheet;
    tbsitpart: TTabSheet;
    tbsitplano: TTabSheet;
    qryevento: TwwQuery;
    ImageList1: TImageList;
    lstsitfunc: TDBLookupListBox;
    sbtndesAssociasitFunc: TSpeedButton;
    sbtndesAssociaTodossitFunc: TSpeedButton;
    sbtnAssociasitFunc: TSpeedButton;
    sbtnAssociaTodossitFunc: TSpeedButton;
    lstsitfuncrel: TDBLookupListBox;
    Label14: TLabel;
    Label2: TLabel;
    qrysitfunc: TwwQuery;
    dssitfunc: TwwDataSource;
    qrysitfuncrel: TwwQuery;
    dssitfuncrel: TwwDataSource;
    qryaux: TwwQuery;
    sbtndesAssociasitParti: TSpeedButton;
    sbtndesAssociaTodossitParti: TSpeedButton;
    sbtnAssociasitParti: TSpeedButton;
    sbtnAssociaTodossitParti: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    sbtndesAssociasitPlano: TSpeedButton;
    sbtndesAssociaTodossitPlano: TSpeedButton;
    sbtnAssociasitPlano: TSpeedButton;
    sbtnAssociaTodossitPlano: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    qrysitpart: TwwQuery;
    dssitpart: TwwDataSource;
    qrysitpartrel: TwwQuery;
    dssitpartrel: TwwDataSource;
    qrysitplano: TwwQuery;
    dsplano: TwwDataSource;
    qrysitplanorel: TwwQuery;
    dssitplanorel: TwwDataSource;
    lstsitpart: TDBLookupListBox;
    lstsitpartrel: TDBLookupListBox;
    lstsitplano: TDBLookupListBox;
    lstsitplanorel: TDBLookupListBox;
    procedure FormCreate(Sender: TObject);
    procedure sbtndesAssociasitFuncClick(Sender: TObject);
    procedure sbtnAssociasitFuncClick(Sender: TObject);
    procedure sbtndesAssociaTodossitFuncClick(Sender: TObject);
    procedure sbtnAssociaTodossitFuncClick(Sender: TObject);
    procedure sbtndesAssociasitPartiClick(Sender: TObject);
    procedure sbtndesAssociasitPlanoClick(Sender: TObject);
    procedure sbtndesAssociaTodossitPartiClick(Sender: TObject);
    procedure sbtndesAssociaTodossitPlanoClick(Sender: TObject);
    procedure sbtnAssociasitPartiClick(Sender: TObject);
    procedure sbtnAssociasitPlanoClick(Sender: TObject);
    procedure sbtnAssociaTodossitPartiClick(Sender: TObject);
    procedure sbtnAssociaTodossitPlanoClick(Sender: TObject);
    procedure lstsitfuncDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lstsitfuncrelDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lstsitpartDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lstsitpartrelDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lstsitplanorelDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lstsitplanoDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lstsitfuncDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lstsitfuncrelDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lstsitfuncMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lstsitfuncrelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lstsitpartMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lstsitpartrelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lstsitplanoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lstsitplanorelMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lstsitpartDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lstsitpartrelDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lstsitplanoDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lstsitplanorelDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
  private
     evento , sidevento : String;
     function   InsereSituacao(qry,qryrel : twwquery ; sChave, sTabela, sIdChave : String) : Boolean;
     function   DeletaSituacao(qry,qryrel : twwquery ; sChave, sTabela, sIdChave : String) : Boolean;
     procedure  PegaIdEvento;  
     procedure  PegaDados(Indice : Integer);  

    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmCadEeventoxSit: TFrmCadEeventoxSit;
  mIdEventoGerador : array[0..50] of Integer;    
implementation

uses UAdmPrev, usistema;

{$R *.DFM}

procedure  TFrmCadEeventoxSit.PegaIdEvento;
begin
   
end;

procedure TFrmCadEeventoxSit.FormCreate(Sender: TObject);
var
  i,j, into : Integer;
  MyTreeNode1  : TTreeNode; 
begin

  inherited;

  
  qryEvento.Close;
  qryEvento.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryEvento.Open;

  qryEvento.First;
  TreeView1.Items.Clear;
  Into:=-1;
  for i := 1 to qryevento.recordcount do begin
    TreeView1.Items.Add(nil,qryevento.fieldbyname('nome').AsString);
    Inc(Into);
    TreeView1.Items[Into].ImageIndex    :=0;
    TreeView1.Items[Into].SelectedIndex :=0;
    MyTreeNode1:= TreeView1.Items[Into];
    mIdEventoGerador[Into] := qryevento.fieldbyname('IDEVENTOGERADOR').AsInteger; 


    qryevento.next;
  end;

  PegaDados(mIdEventoGerador[0]); 

end;

procedure TFrmCadEeventoxSit.PegaDados(Indice : Integer);    
var sFLgUso : string;
begin
  
  sIdEvento := InttoStr(Indice);  
  with qrySitFunc do
  begin
     Close;
     SQL.Clear;
     SQL.Add( ' SELECT DISTINCT  SIT.DESCRICAO , SIT.IDSITFUNC '+
              ' FROM   SITFUNC SIT                             '+
              ' WHERE  SIT.IDSITFUNC NOT IN ( SELECT  E.IDSITFUNC FROM EVENTOXSITFUNC E '+
              '                               WHERE   E.IDEVENTOGERADOR = '+sIdEvento+')');

     if prmMostraSitGeral
     then SQL.Add(' AND SIT.FLGUSO IN (''P'', ''G'') ')
     else SQL.Add(' AND SIT.FLGUSO = ''P'' ');

     SQL.Add(' ORDER BY SIT.DESCRICAO ');
     Open;
  end;

  with qrySitFuncRel do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT SIT.DESCRICAO , SIT.IDSITFUNC , SIT.FLGINTERNO '+
             ' FROM   SITFUNC SIT , EVENTOXSITFUNC E                 '+
             ' WHERE  SIT.IDSITFUNC  = E.IDSITFUNC                   '+
             ' AND E.IDEVENTOGERADOR = '+sIdEvento);

     if prmMostraSitGeral
     then SQL.Add(' AND SIT.FLGUSO IN (''P'', ''G'') ')
     else SQL.Add(' AND SIT.FLGUSO = ''P'' ');

     SQL.Add(' ORDER BY SIT.DESCRICAO ');
     Open;
  end;

  qrysitpart.close;
  qrysitpartrel.close;
  qrysitpart.parambyname('IDEVENTO').AsString := sIdEvento;
  qrysitpartrel.parambyname('IDEVENTO').AsString := sIdEvento;
  qrysitpart.open;
  qrysitpartrel.open;

  qrysitplano.close;
  qrysitplanorel.close;
  qrysitplano.parambyname('IDEVENTO').AsString := sIdEvento;
  qrysitplanorel.parambyname('IDEVENTO').AsString := sIdEvento;
  qrysitplano.open;
  qrysitplanorel.open;

  lstsitfuncrel.Refresh;
  lstsitfunc.Refresh;
  lstsitpart.Refresh;
  lstsitpartrel.Refresh;
  lstsitplano.Refresh;
  lstsitplanorel.Refresh;

end;

function TFrmCadEeventoxSit.DeletaSituacao(qry,qryrel : twwquery ; sChave, sTabela, sIdChave : String): Boolean;
begin
   result := false;

   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(' DELETE FROM '+sTabela+' WHERE '+
                  ' IDEVENTOGERADOR = '+sIdEvento+' '+
                  ' AND '+sChave+' = '+sIdChave+'  ');
   try
      qryaux.execsql;
   except
      exit;
   end;

   result := true;
end;

function TFrmCadEeventoxSit.InsereSituacao(qry,qryrel : twwquery ; sChave, sTabela, sIdChave : String) : Boolean;
begin
   result := false;

   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(' INSERT INTO '+sTabela+'(IDEVENTOGERADOR,'+sChave+') VALUES('+
                  ''+sIdEvento+','+sIdChave+')');
   try
      qryaux.execsql;
   except
      exit;
   end;


   result := true;
end;


procedure TFrmCadEeventoxSit.sbtndesAssociasitFuncClick(Sender: TObject);
begin
  inherited;
  if qrysitfuncrel.isempty then exit;
  if not DeletaSituacao(qrysitfunc,qrysitfuncrel,'IDSITFUNC','EVENTOXSITFUNC',qrysitfuncrel.fieldbyname('IDSITFUNC').AsString) then
  MsgDlg('Não foi possível realizar a exclusão.','Erro', mtError, [mbok],0);
  qrysitfunc.Close;
  qrysitfuncrel.close;
  qrysitfunc.open;
  qrysitfuncrel.open;
  PegaDados(mIdEventoGerador[TreeView1.Selected.Absoluteindex]);  
end;

procedure TFrmCadEeventoxSit.sbtnAssociasitFuncClick(Sender: TObject);
begin
inherited;
  if qrysitfunc.isempty then exit;
  if not InsereSituacao(qrysitfunc,qrysitfuncrel,'IDSITFUNC','EVENTOXSITFUNC',qrysitfunc.fieldbyname('IDSITFUNC').AsString) then
  MsgDlg('Não foi possível realizar a Inclusão.','Erro', mtError, [mbok],0);
  qrysitfunc.Close;
  qrysitfuncrel.close;
  qrysitfunc.open;
  qrysitfuncrel.open;
  PegaDados(mIdEventoGerador[TreeView1.Selected.Absoluteindex]);  
end;

procedure TFrmCadEeventoxSit.sbtndesAssociaTodossitFuncClick(Sender: TObject);
begin
  inherited;
   if qrysitfuncrel.isempty then exit;

   qrysitfuncrel.first;
   while not qrysitfuncrel.EOF do
   begin
      DeletaSituacao(qrysitfunc,qrysitfuncrel,'IDSITFUNC','EVENTOXSITFUNC',qrysitfuncrel.fieldbyname('IDSITFUNC').AsString);
      qrysitfuncrel.next;
   end;

   qrysitfunc.Close;
   qrysitfuncrel.close;
   qrysitfunc.open;
   qrysitfuncrel.open;

   if not  qrysitfuncrel.isempty then
   MsgDlg('Não foi possível realizar a exclusão de todos os registros.','Erro', mtError, [mbok],0);
   PegaDados(mIdEventoGerador[TreeView1.Selected.Absoluteindex]);  
end;

procedure TFrmCadEeventoxSit.sbtnAssociaTodossitFuncClick(Sender: TObject);
begin
  inherited;
   if qrysitfunc.isempty then exit;

   qrysitfunc.first;
   while not qrysitfunc.EOF do
   begin
      InsereSituacao(qrysitfunc,qrysitfuncrel,'IDSITFUNC','EVENTOXSITFUNC',qrysitfunc.fieldbyname('IDSITFUNC').AsString);
      qrysitfunc.next;
   end;

   qrysitfunc.Close;
   qrysitfuncrel.close;
   qrysitfunc.open;
   qrysitfuncrel.open;

   if not  qrysitfunc.isempty then
   MsgDlg('Não foi possível realizar a inclusão de todos os registros.','Erro', mtError, [mbok],0);
   PegaDados(mIdEventoGerador[TreeView1.Selected.Absoluteindex]);  
end;

procedure TFrmCadEeventoxSit.sbtndesAssociasitPartiClick(Sender: TObject);
begin
  inherited;
  if qrysitpartrel.isempty then exit;
  if not DeletaSituacao(qrysitpart,qrysitpartrel,'IDSITPART','EVENTOXSITPART',qrysitpartrel.fieldbyname('IDSITPART').AsString) then
  MsgDlg('Não foi possível realizar a exclusão.','Erro', mtError, [mbok],0);
  qrysitpart.Close;
  qrysitpartrel.close;
  qrysitpart.open;
  qrysitpartrel.open;
  PegaDados(mIdEventoGerador[TreeView1.Selected.Absoluteindex]);  
   
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption+ ' - Desassociando Situação') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TFrmCadEeventoxSit.sbtndesAssociasitPlanoClick(Sender: TObject);
begin
  inherited;
  if qrysitplanorel.isempty then exit;
  if not DeletaSituacao(qrysitplano,qrysitplanorel,'IDSITPLANOPREV','EVENTOXSITPLAPREV',qrysitplanorel.fieldbyname('IDSITPLANOPREV').AsString) then
  MsgDlg('Não foi possível realizar a exclusão.','Erro', mtError, [mbok],0);
  qrysitplano.Close;
  qrysitplanorel.close;
  qrysitplano.open;
  qrysitplanorel.open;
  PegaDados(mIdEventoGerador[TreeView1.Selected.Absoluteindex]);  
end;

procedure TFrmCadEeventoxSit.sbtndesAssociaTodossitPartiClick(Sender: TObject);
begin
  inherited;
   if qrysitpartrel.isempty then exit;

   qrysitpartrel.first;
   while not qrysitpartrel.EOF do
   begin
      DeletaSituacao(qrysitpart,qrysitpartrel,'IDSITPART','EVENTOXSITPART',qrysitpartrel.fieldbyname('IDSITPART').AsString);
      qrysitpartrel.next;
   end;

   qrysitpart.Close;
   qrysitpartrel.close;
   qrysitpart.open;
   qrysitpartrel.open;

   if not  qrysitpartrel.isempty then
   MsgDlg('Não foi possível realizar a exclusão de todos os registros.','Erro', mtError, [mbok],0);
   PegaDados(mIdEventoGerador[TreeView1.Selected.Absoluteindex]);  

    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption + ' - Desassociando Associações') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TFrmCadEeventoxSit.sbtndesAssociaTodossitPlanoClick(Sender: TObject);
begin
  inherited;
   if qrysitplanorel.isempty then exit;

   qrysitplanorel.first;
   while not qrysitplanorel.EOF do
   begin
      DeletaSituacao(qrysitplano,qrysitplanorel,'IDSITPLANOPREV','EVENTOXSITPLAPREV',qrysitplanorel.fieldbyname('IDSITPLANOPREV').AsString);
      qrysitplanorel.next;
   end;

   qrysitplano.Close;
   qrysitplanorel.close;
   qrysitplano.open;
   qrysitplanorel.open;

   if not  qrysitplanorel.isempty then
   MsgDlg('Não foi possível realizar a exclusão de todos os registros.','Erro', mtError, [mbok],0);
   PegaDados(mIdEventoGerador[TreeView1.Selected.Absoluteindex]);  
end;

procedure TFrmCadEeventoxSit.sbtnAssociasitPartiClick(Sender: TObject);
begin
  inherited;
  if qrysitpart.isempty then exit;
  if not InsereSituacao(qrysitpart,qrysitpartrel,'IDSITPART','EVENTOXSITPART',qrysitpart.fieldbyname('IDSITPART').AsString) then
  MsgDlg('Não foi possível realizar a Inclusão.','Erro', mtError, [mbok],0);
  qrysitpart.Close;
  qrysitpartrel.close;
  qrysitpart.open;
  qrysitpartrel.open;
  PegaDados(mIdEventoGerador[TreeView1.Selected.Absoluteindex]);  

    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption + ' - Associando Situação') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TFrmCadEeventoxSit.sbtnAssociasitPlanoClick(Sender: TObject);
begin
  inherited;
  if qrysitplano.isempty then exit;
  if not InsereSituacao(qrysitplano,qrysitplanorel,'IDSITPLANOPREV','EVENTOXSITPLAPREV',qrysitplano.fieldbyname('IDSITPLANOPREV').AsString) then
  MsgDlg('Não foi possível realizar a Inclusão.','Erro', mtError, [mbok],0);
  qrysitplano.Close;
  qrysitplanorel.close;
  qrysitplano.open;
  qrysitplanorel.open;
  PegaDados(mIdEventoGerador[TreeView1.Selected.Absoluteindex]); 
end;

procedure TFrmCadEeventoxSit.sbtnAssociaTodossitPartiClick(Sender: TObject);
begin
  inherited;
   if qrysitpart.isempty then exit;

   qrysitpart.first;
   while not qrysitpart.EOF do
   begin
      InsereSituacao(qrysitpart,qrysitpartrel,'IDSITPART','EVENTOXSITPART',qrysitpart.fieldbyname('IDSITPART').AsString);
      qrysitpart.next;
   end;

   qrysitpart.Close;
   qrysitpartrel.close;
   qrysitpart.open;
   qrysitpartrel.open;

   if not  qrysitpart.isempty then
   MsgDlg('Não foi possível realizar a inclusão de todos os registros.','Erro', mtError, [mbok],0);
   PegaDados(mIdEventoGerador[TreeView1.Selected.Absoluteindex]); 

    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption + ' - Associando Associações') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TFrmCadEeventoxSit.sbtnAssociaTodossitPlanoClick(Sender: TObject);
begin
  inherited;
   if qrysitplano.isempty then exit;

   qrysitplano.first;
   while not qrysitplano.EOF do
   begin
      InsereSituacao(qrysitplano,qrysitplanorel,'IDSITPLANOPREV','EVENTOXSITPLAPREV',qrysitplano.fieldbyname('IDSITPLANOPREV').AsString);
      qrysitplano.next;
   end;

   qrysitplano.Close;
   qrysitplanorel.close;
   qrysitplano.open;
   qrysitplanorel.open;

   if not  qrysitplano.isempty then
   MsgDlg('Não foi possível realizar a inclusão de todos os registros.','Erro', mtError, [mbok],0);
   PegaDados(mIdEventoGerador[TreeView1.Selected.Absoluteindex]); 
end;

procedure TFrmCadEeventoxSit.lstsitfuncDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := True;
end;

procedure TFrmCadEeventoxSit.lstsitfuncrelDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := True;
end;

procedure TFrmCadEeventoxSit.lstsitpartDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := True;
end;

procedure TFrmCadEeventoxSit.lstsitpartrelDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := True;
end;

procedure TFrmCadEeventoxSit.lstsitplanorelDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := True;
end;

procedure TFrmCadEeventoxSit.lstsitplanoDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := True;
end;

procedure TFrmCadEeventoxSit.lstsitfuncDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
 if (Sender is TDBLookUpListBox) and (Source is TDBLookUpListBox)
 then begin
     TDBLookUpListBox(Source).EndDrag(True);
     if not (TDBLookUpListBox(Source).Name = 'lstsitfuncrel') then exit;
     if qrysitfuncrel.isempty then exit;
     if not DeletaSituacao(qrysitfunc,qrysitfuncrel,'IDSITFUNC','EVENTOXSITFUNC',qrysitfuncrel.fieldbyname('IDSITFUNC').AsString) then
     MsgDlg('Não foi possível realizar a exclusão.','Erro', mtError, [mbok],0)
     else
     begin
        qrysitfunc.Close;
        qrysitfuncrel.close;
        qrysitfunc.open;
        qrysitfuncrel.open;
     end;
  end;
end;

procedure TFrmCadEeventoxSit.lstsitfuncrelDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
 if (Sender is TDBLookUpListBox) and (Source is TDBLookUpListBox)
 then begin
     TDBLookUpListBox(Source).EndDrag(True);
     if not (TDBLookUpListBox(Source).Name = 'lstsitfunc') then exit;
     if qrysitfunc.isempty then exit;
     if not InsereSituacao(qrysitfunc,qrysitfuncrel,'IDSITFUNC','EVENTOXSITFUNC',qrysitfunc.fieldbyname('IDSITFUNC').AsString) then
     MsgDlg('Não foi possível realizar a Inclusão.','Erro', mtError, [mbok],0)
     else
     begin
        qrysitfunc.Close;
        qrysitfuncrel.close;
        qrysitfunc.open;
        qrysitfuncrel.open;
     end;
 end;
end;

procedure TFrmCadEeventoxSit.lstsitfuncMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TFrmCadEeventoxSit.lstsitfuncrelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TFrmCadEeventoxSit.lstsitpartMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TFrmCadEeventoxSit.lstsitpartrelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TFrmCadEeventoxSit.lstsitplanoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TFrmCadEeventoxSit.lstsitplanorelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TFrmCadEeventoxSit.lstsitpartDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
 if (Sender is TDBLookUpListBox) and (Source is TDBLookUpListBox)
 then begin
     TDBLookUpListBox(Source).EndDrag(True);
     if not (TDBLookUpListBox(Source).Name = 'lstsitpartrel') then exit;
     if qrysitpartrel.isempty then exit;
     if not DeletaSituacao(qrysitpart,qrysitpartrel,'IDSITPART','EVENTOXSITPART',qrysitpartrel.fieldbyname('IDSITPART').AsString) then
     MsgDlg('Não foi possível realizar a exclusão.','Erro', mtError, [mbok],0)
     else
     begin
         qrysitpart.Close;
         qrysitpartrel.close;
         qrysitpart.open;
         qrysitpartrel.open;
   end;
 end;
end;

procedure TFrmCadEeventoxSit.lstsitpartrelDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
 if (Sender is TDBLookUpListBox) and (Source is TDBLookUpListBox)
 then begin
     TDBLookUpListBox(Source).EndDrag(True);
     if not (TDBLookUpListBox(Source).Name = 'lstsitpart') then exit;
     if qrysitpart.isempty then exit;
     if not InsereSituacao(qrysitpart,qrysitpartrel,'IDSITPART','EVENTOXSITPART',qrysitpart.fieldbyname('IDSITPART').AsString) then
     MsgDlg('Não foi possível realizar a Inclusão.','Erro', mtError, [mbok],0)
     else
     begin
         qrysitpart.Close;
         qrysitpartrel.close;
         qrysitpart.open;
         qrysitpartrel.open;
   end;
 end;
end;

procedure TFrmCadEeventoxSit.lstsitplanoDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
 if (Sender is TDBLookUpListBox) and (Source is TDBLookUpListBox)
 then begin
     TDBLookUpListBox(Source).EndDrag(True);
     if not (TDBLookUpListBox(Source).Name = 'lstsitplanorel') then exit;
     if qrysitplanorel.isempty then exit;
     if not DeletaSituacao(qrysitplano,qrysitplanorel,'IDSITPLANOPREV','EVENTOXSITPLAPREV',qrysitplanorel.fieldbyname('IDSITPLANOPREV').AsString) then
     MsgDlg('Não foi possível realizar a exclusão.','Erro', mtError, [mbok],0)
     else
     begin
        qrysitplano.Close;
        qrysitplanorel.close;
        qrysitplano.open;
        qrysitplanorel.open;
     end;
 end;
end;

procedure TFrmCadEeventoxSit.lstsitplanorelDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
 if (Sender is TDBLookUpListBox) and (Source is TDBLookUpListBox)
 then begin
     TDBLookUpListBox(Source).EndDrag(True);
     if not (TDBLookUpListBox(Source).Name = 'lstsitplano') then exit;
     if qrysitplano.isempty then exit;
     if not InsereSituacao(qrysitplano,qrysitplanorel,'IDSITPLANOPREV','EVENTOXSITPLAPREV',qrysitplano.fieldbyname('IDSITPLANOPREV').AsString) then
     MsgDlg('Não foi possível realizar a Inclusão.','Erro', mtError, [mbok],0)
     else
     begin
        qrysitplano.Close;
        qrysitplanorel.close;
        qrysitplano.open;
        qrysitplanorel.open;
     end;
 end;
end;

procedure TFrmCadEeventoxSit.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  
  PegaDados(mIdEventoGerador[TreeView1.Selected.Absoluteindex]);  
end;

end.

