// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
// Autor(a)    : BRUNO AZEVEDO
// Data        : 07/12/2010
// Pendência   : SOL 148897 KINTANA 1055074
// Descricao   : Adicionado componente conspart que foi retirado por engano.
//------------------------------------------------------------------------------
// Autor(a)    : BRUNO AZEVEDO
// Data        : 07/07/2010
// Pendência   : SOL 138980 KINTANA 851913
// Descricao   : Implementar o controle de transação.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 241/2007
// Pendência   : 24291
// Rotina      : MontaSelect
// Descricao   : retirado o FLGDESATIVADO
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 20/10/2006
// Rotina      : Insere(...)
// Pendencia   : 23563
// Alteração   : Gravação do campo IDPARTICIPANTE no insert na ReservaPart
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FAssocReservaPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, UConsPart, DBCtrls, MontaSelect, Db, Wwdatsrc,
  DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, Menus, DBaseDados;

type
  TFrmAssocReservaPart = class(TfrmSairAjuda)
    pnlInformacao: TPanel;
    Panel1: TPanel;
    lblValores: TLabel;
    ConsPart1: TConsPart;
    Panel5: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edSitPatro: TEdit;
    edSitFundacao: TEdit;
    bbtnProcurar: TBitBtn;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    lstbxreserva: TDBLookupListBox;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    Panel7: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblpart: TLabel;
    lblpatro: TLabel;
    lblplano: TLabel;
    Label7: TLabel;
    lblfilial: TLabel;
    qryreserva: TwwQuery;
    dsreserva: TwwDataSource;
    qryreservarel: TwwQuery;
    dsreservarel: TwwDataSource;
    MontaSelectPart: TMontaSelect;
    qryaux: TwwQuery;
    Label8: TLabel;
    Label9: TLabel;
    qryreservarelNOME: TStringField;
    qryreservarelIDTIPORESERVA: TFloatField;
    qryreservarelFLGATIVO: TStringField;
    qryreservarelFLGATIVOC: TFloatField;
    qryreservarelATIVO: TStringField;
    dbgridreservarel: TwwDBGrid;
    popmnureserva: TPopupMenu;
    AtivarReserva1: TMenuItem;
    DesativarReserva1: TMenuItem;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure dbgridreservarelCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure qryreservarelCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dbgridreservarelDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lstbxreservaDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgridreservarelMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lstbxreservaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgridreservarelDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lstbxreservaDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DesativarReserva1Click(Sender: TObject);
    procedure AtivarReserva1Click(Sender: TObject);
    procedure popmnureservaPopup(Sender: TObject);
    procedure dbgridreservarelDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function Insere(sidpessoa,sidplanoprev,sidpessjur,
                    sseqproposta,sidtiporeserva : String): Boolean;
    function Deleta(sidpessoa,sidplanoprev,sidpessjur,
                    sseqproposta,sidtiporeserva : String): Boolean;
    procedure DesativaReserva;
    procedure AtivaReserva;                       
  public
     sidpessoa,
     sidplanoprev,
     sidpessjur,
     sSeqProposta : String;
    { Public declarations }
  end;



var
  FrmAssocReservaPart: TFrmAssocReservaPart;



implementation

uses UMensErro, USistema, UAdmPrev;
{$R *.DFM}

procedure TFrmAssocReservaPart.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '') then
      begin
          {Carrega Campos}
           sIdPessoa          := MontaSelectPart.ValoresChave[0];
           sIdPessJur         := MontaSelectPart.ValoresChave[1];
           sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];
           sSeqProposta       := MontaSelectPart.ValoresChave[7];
           lblpart.caption        := MontaSelectPart.ValoresChave[3];
           lblPatro.caption       := MontaSelectPart.ValoresChave[5];
           lblPlano.caption       := MontaSelectPart.ValoresChave[6];


           pnlInformacao.Enabled := True;


           ConsPart1.sIdPessoa := sidpessoa;
           ConsPart1.sSeqProposta := sseqproposta;
           ConsPart1.sIdPlanoprev := sidplanoprev;
           ConsPart1.DataBaseName := 'BaseDados';
           ConsPart1.sIdPessjur := sidpessjur;
           ConsPart1.Enabled := true;

           qryreserva.close;
           qryreserva.parambyname('IDPESSOA').AsString := sidpessoa ;
           qryreserva.parambyname('IDPLANOPREV').AsString := sidplanoprev ;
           qryreserva.parambyname('IDPESSJUR').AsString := sidpessjur ;
           qryreserva.parambyname('SEQPROPOSTA').AsString := sseqproposta ;
           qryreserva.open;

           qryreservarel.close;
           qryreservarel.parambyname('IDPESSOA').AsString := sidpessoa ;
           qryreservarel.parambyname('IDPLANOPREV').AsString := sidplanoprev ;
           qryreservarel.parambyname('IDPESSJUR').AsString := sidpessjur ;
           qryreservarel.parambyname('SEQPROPOSTA').AsString := sseqproposta ;
           qryreservarel.open;


    end
    else
    begin
       qryreserva.close;
       qryreservarel.close;
       sIdPessoa          := '';
       sIdPessJur         := '';
       sIdPlanoPrev       := '';
       sSeqProposta       := '';
       lblpart.caption    := '';
       lblPatro.caption   := '';
       lblPlano.caption   := '';
    end;
end;

procedure TFrmAssocReservaPart.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;
  if qryreserva.isempty then exit;
  if not Insere(sidpessoa,sidplanoprev,sidpessjur,sseqproposta,qryreserva.fieldbyname('IDTIPORESERVA').AsString) then
  MsgDlg('Não foi possível realizar a Inclusão.','Erro', mtError, [mbok],0);
  qryreserva.Close;
  qryreserva.open;
  qryreservarel.close;
  qryreservarel.open;
end;

procedure TFrmAssocReservaPart.sbtnDesassociaTodosClick(Sender: TObject);
begin
  inherited;
   if qryreserva.isempty then exit;
   
   qryreserva.first;
   while not qryreserva.EOF do
   begin
      Insere(sidpessoa,sidplanoprev,sidpessjur,sseqproposta,qryreserva.fieldbyname('IDTIPORESERVA').AsString);
      qryreserva.next;
   end;

   qryreserva.Close;
   qryreserva.open;
   qryreservarel.close;
   qryreservarel.open;

   if not  qryreserva.isempty then
   MsgDlg('Não foi possível realizar a inclusão de todos os registros.','Erro', mtError, [mbok],0);
end;

procedure TFrmAssocReservaPart.sbtnAssociaClick(Sender: TObject);
begin
  inherited;
  if qryreservarel.isempty then exit;
  if not Deleta(sidpessoa,sidplanoprev,sidpessjur,sseqproposta,qryreservarel.fieldbyname('IDTIPORESERVA').AsString) then
  if MsgDlg('Não foi possível realizar a Exclusão. Deseja apenas marcar a reserva como desativada ?','Confirmação', mtConfirmation, [mbyes,mbno],0) = mryes then
  begin
     DesativaReserva;
  end;
  qryreserva.Close;
  qryreserva.open;
  qryreservarel.close;
  qryreservarel.open;
end;

procedure TFrmAssocReservaPart.sbtnAssociaTodosClick(Sender: TObject);
begin
  inherited;
   if qryreservarel.isempty then exit;
   qryreservarel.first;
   while not qryreservarel.EOF do
   begin
      Deleta(sidpessoa,sidplanoprev,sidpessjur,sseqproposta,qryreservarel.fieldbyname('IDTIPORESERVA').AsString);
      qryreservarel.next;
   end;

   qryreserva.Close;
   qryreserva.open;
   qryreservarel.close;
   qryreservarel.open;

   if not  qryreservarel.isempty then
   if MsgDlg('Não foi possível realizar a Exclusão de todos os registros. Deseja apenas marcar as reservas como desativadas ?','Confirmação', mtConfirmation, [mbyes,mbno],0) = mryes then
   begin
      qryreservarel.first;
      while not qryreservarel.EOF do
      begin
         DesativaReserva;
         qryreservarel.next;
      end;
   end;

   qryreserva.Close;
   qryreserva.open;
   qryreservarel.close;
   qryreservarel.open;

end;

function TFrmAssocReservaPart.Deleta(sidpessoa,sidplanoprev,sidpessjur,
                                     sseqproposta,sidtiporeserva : String): Boolean;
begin
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913
  try
    if not dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913

    result := false;

    qryaux.close;
    qryaux.sql.clear;
    qryaux.sql.add(' DELETE FROM RESERVAPART WHERE '+
                  ' IDPESSOA = '+sidpessoa+' '+
                  ' AND IDPESSJUR = '+sidpessjur+' '+
                  ' AND IDPLANOPREV = '+sidplanoprev+' '+
                  ' AND SEQPROPOSTA = '+sseqproposta+' '+
                  ' AND IDTIPORESERVA = '+sidtiporeserva+'  ');
    try
      qryaux.execsql;
    except
      exit;
    end;

    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes('Associação de Reservas ao Participante - Apagando Reserva') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

    result := true;
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913
  finally
    if dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.Commit;
    end;
  end;
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913
end;

function TFrmAssocReservaPart.Insere(sidpessoa,sidplanoprev,sidpessjur,
                                     sseqproposta,sidtiporeserva : String): Boolean;
begin
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913
  try
    if not dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913

     result := false;

     qryaux.close;
     qryaux.sql.clear;
     qryaux.sql.add(' INSERT INTO RESERVAPART(IDPESSOA,IDPESSJUR,IDTIPORESERVA'+
                    ',IDPLANOPREV,SEQPROPOSTA,VALORRESERVA,FLGATIVO, '+
                    'IDPARTICIPANTE)'+   
                    ' VALUES('+sidpessoa+','+sidpessjur+','+sidtiporeserva+','+
                    ' '+sidplanoprev+','+sseqproposta+',0,1, ' +
                    sidpessoa + ')'
                   );
     try
        qryaux.execsql;
     except
        exit;
     end;


    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes('Associação de Reservas ao Participante - Inserindo Reserva') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

    result := true;

  //BRUNO AZEVEDO SOL 138980 KINTANA 851913
  finally
    if dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.Commit;
    end;
  end;
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913
end;


procedure TFrmAssocReservaPart.dbgridreservarelCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if qryreservarel.fieldbyname('FLGATIVOC').AsInteger = 0 then
  begin
     ABrush.Color := clWindow;
     AFont.Color  := clRed;
     if highlight then begin
        ABrush.Color := clNavy;
        AFont.Color  := clWindow;
     end;
  end;
end;

procedure TFrmAssocReservaPart.qryreservarelCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryreservarel.fieldbyname('FLGATIVOC').AsInteger = 1 then
  qryreservarel.fieldbyname('ATIVO').AsString := 'Ativo' 
  else   qryreservarel.fieldbyname('ATIVO').AsString := 'Desativado' ;
end;

procedure TFrmAssocReservaPart.FormCreate(Sender: TObject);
begin
  inherited;
bbtnProcurarClick(self);
end;

procedure TFrmAssocReservaPart.dbgridreservarelDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;

  Accept := True;
end;

procedure TFrmAssocReservaPart.lstbxreservaDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;

  Accept := True;
end;

procedure TFrmAssocReservaPart.dbgridreservarelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  
  TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TFrmAssocReservaPart.lstbxreservaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TwwDBGrid(Sender).BeginDrag(True);
end;

procedure TFrmAssocReservaPart.dbgridreservarelDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
 if (Sender is TwwDBGrid) and (Source is TDBLookUpListBox)
 then begin
     TDBLookUpListBox(Source).EndDrag(True);
     if not (TDBLookUpListBox(Source).Name = 'lstbxreserva') then exit;
     if qryreserva.isempty then exit;
     if not Insere(sidpessoa,sidplanoprev,sidpessjur,sseqproposta,qryreserva.fieldbyname('IDTIPORESERVA').AsString) then
     MsgDlg('Não foi possível realizar a Inclusão.','Erro', mtError, [mbok],0);
     qryreserva.Close;
     qryreserva.open;
     qryreservarel.close;
     qryreservarel.open;
 end;
end;

procedure TFrmAssocReservaPart.lstbxreservaDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
 if (Sender is TDBLookUpListBox) and (Source is TwwDBGrid)
 then begin
     TwwDBGrid(Source).EndDrag(True);
     if not (TwwDBGrid(Source).Name = 'dbgridreservarel') then exit;
     if qryreservarel.isempty then exit;
     if qryreservarel.isempty then exit;
     if not Deleta(sidpessoa,sidplanoprev,sidpessjur,sseqproposta,qryreservarel.fieldbyname('IDTIPORESERVA').AsString) then
     if MsgDlg('Não foi possível realizar a Exclusão. Deseja apenas marcar a reserva como desativada ?','Confirmação', mtConfirmation, [mbyes,mbno],0) = mryes then
     begin
        DesativaReserva;
     end;
     qryreserva.Close;
     qryreserva.open;
     qryreservarel.close;
     qryreservarel.open;
  end;
end;

procedure TFrmAssocReservaPart.DesativaReserva;
begin
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913
  try
    if not dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913

     qryaux.close;
     qryaux.sql.clear;
     qryaux.sql.add(' UPDATE RESERVAPART SET FLGATIVO = 0 '+
                    ' WHERE  IDPESSOA =  '+sidpessoa+' '+
                    ' AND IDPLANOPREV = '+sidplanoprev+' '+
                    ' AND IDPESSJUR = '+sidpessjur+' '+
                    ' AND IDTIPORESERVA = '+qryreservarel.fieldbyname('IDTIPORESERVA').AsString+' '+
                    ' AND SEQPROPOSTA = '+sseqproposta+' ');
     try
        qryaux.execsql;
     except
     end;


    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes('Associação de Reservas ao Participante - Desassociando Reserva') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913
  finally
    if dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.Commit;
    end;
  end;
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913
end;

procedure TFrmAssocReservaPart.DesativarReserva1Click(Sender: TObject);
begin
  inherited;
  DesativaReserva
end;

procedure TFrmAssocReservaPart.AtivaReserva;
begin
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913
  try
    if not dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913
    
     qryaux.close;
     qryaux.sql.clear;
     qryaux.sql.add(' UPDATE RESERVAPART SET FLGATIVO = 1 '+
                    ' WHERE  IDPESSOA =  '+sidpessoa+' '+
                    ' AND IDPLANOPREV = '+sidplanoprev+' '+
                    ' AND IDPESSJUR = '+sidpessjur+' '+
                    ' AND IDTIPORESERVA = '+qryreservarel.fieldbyname('IDTIPORESERVA').AsString+' '+
                    ' AND SEQPROPOSTA = '+sseqproposta+' ');
     try
        qryaux.execsql;
     except
     end;
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913
  finally
    if dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.Commit;
    end;
  end;
  //BRUNO AZEVEDO SOL 138980 KINTANA 851913
end;

procedure TFrmAssocReservaPart.AtivarReserva1Click(Sender: TObject);
begin
  inherited;
   AtivaReserva;
end;

procedure TFrmAssocReservaPart.popmnureservaPopup(Sender: TObject);
begin
  inherited;
   if qryreservarel.FieldByName('FLGATIVOC').AsInteger = 1 then
   begin
      AtivarReserva1.enabled := false;
      DesativarReserva1.enabled := true;
   end
   else
   begin
      AtivarReserva1.enabled := true;
      DesativarReserva1.enabled := false;
   end;


end;

procedure TFrmAssocReservaPart.dbgridreservarelDblClick(Sender: TObject);
begin
  inherited;
   if qryreservarel.FieldByName('FLGATIVOC').AsInteger = 1 then
   begin
      DesativaReserva;
   end
   else
   begin
      AtivaReserva;
   end;

   qryreserva.Close;
   qryreserva.open;
   qryreservarel.close;
   qryreservarel.open;
end;

procedure TFrmAssocReservaPart.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 21.06.2003

end;

end.

