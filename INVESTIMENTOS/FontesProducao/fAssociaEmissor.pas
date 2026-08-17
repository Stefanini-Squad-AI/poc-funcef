unit FAssociaEmissor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, DBGrids,
  Db, DBTables, Wwquery, Wwdatsrc, Wwdbigrd, Wwdbgrid, DBCtrls, ComCtrls,
  TB97Tlbr, Mask, IvDictio, IvMulti, IvEMulti;

type
  TfrmAssociaEmissor = class(TfrmOkCancelar)
    dsEmissor: TwwDataSource;
    qryEmissor: TwwQuery;
    Label11: TLabel;
    pgctrlEmissor: TPageControl;
    tbsBolsa: TTabSheet;
    tbsParametros: TTabSheet;
    Panel1: TPanel;
    sbtnAssociaBolsa: TSpeedButton;
    sbtnAssociaTodasBolsas: TSpeedButton;
    sbtnDesassociaBolsa: TSpeedButton;
    sbtnDesassociaTodasBolsas: TSpeedButton;
    Panel3: TPanel;
    qryAux: TwwQuery;
    Label5: TLabel;
    Label6: TLabel;
    sbtnAssociaParam: TSpeedButton;
    sbtnAssociaTodosParam: TSpeedButton;
    sbtnDesassociaParam: TSpeedButton;
    sbtnDesassociaTodosParam: TSpeedButton;
    dblkparametros: TDBLookupListBox;
    lblParam: TLabel;
    lblParamEmissor: TLabel;
    qryParamXEmissor: TwwQuery;
    qryParamXEmissorDESCPARAMEMISSOR: TStringField;
    qryParamXEmissorIDPARAMEMISSOR: TFloatField;
    dsParamXEmissor: TwwDataSource;
    dsParametros: TwwDataSource;
    qryParametros: TwwQuery;
    qryBolsas: TwwQuery;
    DSBolsas: TwwDataSource;
    qryEmissorXBolsas: TwwQuery;
    DSEmissorXBolsas: TwwDataSource;
    qryEmissorIDPESSOA: TFloatField;
    qryEmissorNOME: TStringField;
    qryEmissorRAZAOSOCIAL: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    dblkBolsas: TDBLookupListBox;
    dblckEmissorXBolsas: TDBLookupListBox;
    dblkParamXEmissor: TDBLookupListBox;
    qryAuxII: TwwQuery;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    qryEmissorSIGLAEMISSOR: TStringField;
    dblkEmissorParam: TDBLookupListBox;
    dblkEmissor: TDBLookupListBox;
    sbtnAssociaEmissor: TSpeedButton;
    sbtnAssociaTodosEmissor: TSpeedButton;
    sbtnDesassociaEmissor: TSpeedButton;
    sbtnDesassociaTodosEmissor: TSpeedButton;
    dsEmissorParam: TwwDataSource;
    qryEmissorParam: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    Label2: TLabel;
    qryBuscaEmissor: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure pgctrlEmissorChange(Sender: TObject);
    procedure dblkBolsasDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure dblkBolsasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dblkBolsasMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbtnAssociaParamClick(Sender: TObject);
    procedure sbtnAssociaTodosParamClick(Sender: TObject);
    procedure sbtnDesassociaParamClick(Sender: TObject);
    procedure sbtnDesassociaTodosParamClick(Sender: TObject);
    procedure dblkparametrosDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure dblkparametrosDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dblkparametrosMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgrdParamXEmissorDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure dbgrdParamXEmissorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbtnAssociaBolsaClick(Sender: TObject);
    procedure sbtnAssociaTodasBolsasClick(Sender: TObject);
    procedure sbtnDesassociaBolsaClick(Sender: TObject);
    procedure sbtnDesassociaTodasBolsasClick(Sender: TObject);
    procedure dblkParamXEmissorDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dblckEmissorXBolsasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dblckEmissorXBolsasDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure dblkParamXEmissorDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure dblckEmissorXBolsasMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbtnAssociaEmissorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnAssociaTodosEmissorClick(Sender: TObject);
    procedure sbtnDesassociaEmissorClick(Sender: TObject);
    procedure sbtnDesassociaTodosEmissorClick(Sender: TObject);
    procedure qryEmissorAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
	 function  AssociaBolsa:Boolean;
	 function  AssociaParametro:Boolean;
	 procedure DesassociaBolsa(Tudo:Boolean);
	 procedure DesassociaParametro(Tudo:Boolean);
	 procedure RefazQuerys;
         procedure AssociaEmissor;
         procedure AssociaTodosEmissor;
         procedure DesassociaEmissor;
         procedure DesassociaTodosEmissor;                           
         Function ExisteAcao : boolean ;
  public
    { Public declarations }
  end;

var
 frmAssociaEmissor: TfrmAssociaEmissor;
 Emissor,Parametro,Bolsa : STRING;
 sSQLEmissorParam, sSQLEmissor : String;
 iVolta, iVez : Integer;
 bTodosEmi : Boolean;
implementation

uses UDataBase, UMensErro, USistema, UBibliotecaInvest;

{$R *.DFM}
procedure TfrmAssociaEmissor.RefazQuerys;
begin
   If qryEmissor.RecordCount = 1 Then
   Begin
      if pgctrlEmissor.ActivePage = tbsBolsa then
      begin
   	qryBolsas.Close;
   	qryBolsas.ParamByName('Emissor').AsInteger := qryEmissor.FieldByName('IdEmissor').AsInteger;
   	qryBolsas.Open;

   	qryEmissorXBolsas.Close;
   	qryEmissorXBolsas.ParamByName('Emissor').AsInteger := qryEmissor.FieldByName('IdEmissor').AsInteger;
   	qryEmissorXBolsas.Open;

   	sbtnAssociaBolsa.Enabled        	:= not(qryBolsas.IsEmpty);
   	sbtnAssociaTodasBolsas.Enabled   	:= not(qryBolsas.IsEmpty);
   	sbtnDesassociaBolsa.Enabled     	:= not(qryEmissorXBolsas.IsEmpty);
   	sbtnDesassociaTodasBolsas.Enabled	:= not(qryEmissorXBolsas.IsEmpty);
      end
      else
 	if pgctrlEmissor.ActivePage  = tbsParametros then
        begin
           qryparametros.Close;
  	   qryParametros.ParamByName('Emissor').AsInteger := qryEmissor.FieldByName('IdEmissor').AsInteger;
   	   qryparametros.Open;

   	   qryParamXEmissor.Close;
           qryParamXEmissor.ParamByName('Emissor').AsInteger := qryEmissor.FieldByName('IdEmissor').AsInteger;
   	   qryParamXEmissor.Open;

   	   sbtnAssociaParam.Enabled         := not(qryParametros.IsEmpty);
   	   sbtnAssociaTodosParam.Enabled    := not(qryParametros.IsEmpty);
   	   sbtnDesassociaParam.Enabled      := not(qryParamXEmissor.IsEmpty);
   	   sbtnDesassociaTodosParam.Enabled := not(qryParamXEmissor.IsEmpty);
	end;
   End
   Else
   Begin
      if pgctrlEmissor.ActivePage = tbsBolsa then
      begin
   	qryBolsas.Close;
   	qryBolsas.ParamByName('Emissor').AsInteger := -1;
   	qryBolsas.Open;

   	qryEmissorXBolsas.Close;
   	qryEmissorXBolsas.ParamByName('Emissor').AsInteger := -1;
   	qryEmissorXBolsas.Open;

   	sbtnAssociaBolsa.Enabled        	:= not(qryBolsas.IsEmpty);
   	sbtnAssociaTodasBolsas.Enabled   	:= not(qryBolsas.IsEmpty);
   	sbtnDesassociaBolsa.Enabled     	:= not(qryEmissorXBolsas.IsEmpty);
   	sbtnDesassociaTodasBolsas.Enabled	:= not(qryEmissorXBolsas.IsEmpty);
      end
      else
 	if pgctrlEmissor.ActivePage  = tbsParametros then
        begin
           qryparametros.Close;
  	   qryParametros.ParamByName('Emissor').AsInteger := -1;
   	   qryparametros.Open;

	   qryParamXEmissor.Close;
           qryParamXEmissor.ParamByName('Emissor').AsInteger := -1;
   	   qryParamXEmissor.Open;

 	   sbtnAssociaParam.Enabled         := not(qryParametros.IsEmpty);
   	   sbtnAssociaTodosParam.Enabled    := not(qryParametros.IsEmpty);
   	   sbtnDesassociaParam.Enabled      := not(qryParamXEmissor.IsEmpty);
   	   sbtnDesassociaTodosParam.Enabled := not(qryParamXEmissor.IsEmpty);
	end;
   End
end;

procedure TfrmAssociaEmissor.FormActivate(Sender: TObject);
begin
	inherited;
	qryEmissor.Close;
	qryEmissor.Open;

	pgctrlEmissor.ActivePage := tbsParametros;
	RefazQuerys;
end;

function TfrmAssociaEmissor.ExisteAcao:Boolean;
begin
	Result := False;
   with qryAuxII do
   begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT	AXB.IDEMISSOR FROM '+ Sistema.PrefixoServidor +'ACOESXBOLSA AXB ');
      SQL.Add('WHERE 	AXB.IDEMISSOR = '+ qryEmissor.FieldByName('IdEmissor').AsString );
      SQL.Add('	And 	AXB.IDBOLSAVALORES = '+ qryEmissorXBolsas.FieldByName('IdBolsaValores').AsString );

      Prepare;
      Open;

      Result	:= not(IsEmpty);
      if not(IsEmpty) then
         MsgDlg('Bolsa com Ações Negociadas não pode ser excluída.','Atenção',mtError,[mbOk],0);
   end;
end;

procedure TfrmAssociaEmissor.pgctrlEmissorChange(Sender: TObject);
begin
	inherited;
	RefazQuerys;
  // Cancelar drags para eliminar a hipotese do usuario ter iniciado um drag
  // e nao ter terminado
	if dblkBolsas.Dragging then dblkBolsas.EndDrag(False);
	if dblkparametros.Dragging then dblkparametros.EndDrag(False);
	if dblkparametros.Dragging then dblkparametros.EndDrag(False);
	if dblkParamXEmissor.Dragging then dblkParamXEmissor.EndDrag(False);
end;

// ************* FUNCOES DE ASSOCIAÇÃO - Parametros ********** //
procedure TfrmAssociaEmissor.AssociaTodosEmissor;
Var
  sSQLParamIDEmissor, sSQLParamIDEmissorDisp, IDEMISSOR,IDPARAMEMISSOR : string;
Begin
   with qryAux do
   begin
      sSQLParamIDEmissor      :=' SELECT DISTINCT                            '+
                                '    PE.IdParamEmissor, P.DescParamEmissor   '+
                                ' FROM                                       '+
                                '    PARAMxEMISSOR PE , PARAMEMISSOR P '+
                                ' WHERE                                      '+
                                ' PE.IdParamEmissor = P.IdParamEmissor       ';

      sSQLParamIDEmissorDisp  :=' SELECT DESCPARAMEMISSOR,IDPARAMEMISSOR     '+
                                ' FROM PARAMEMISSOR                       '+
                                ' WHERE IDPARAMEMISSOR = -1                  ';
      qryBuscaEmissor.Close;
      qryBuscaEmissor.Open;
      qryParametros.First;
      While Not qryParametros.EOF Do
      Begin
         qryEmissorParam.First;
         While Not qryEmissorParam.EOF Do
         Begin
            IDEMISSOR      := qryEmissorParam.FieldByName('IDEMISSOR').AsString;
            IDPARAMEMISSOR := qryParametros.FieldByName('IDPARAMEMISSOR').AsString;
            If (Not qryBuscaEmissor.Locate('IDEMISSOR;IDPARAMEMISSOR',
                        VarArrayOf([IDEMISSOR, IDPARAMEMISSOR]),[loPartialKey])) Then
            Begin
               Close;
               SQL.Clear;
               SQL.Add(' INSERT INTO ' +	Sistema.PrefixoServidor +
                                    'PARAMXEMISSOR(IDEMISSOR,IDPARAMEMISSOR)' );
               SQL.Add(' VALUES('	 +
                	IDEMISSOR+ ',' +IDPARAMEMISSOR+ ')');
               Prepare;
               ExecSQL;
               UnPrepare;
            End;
            qryEmissorParam.Next;
         End;
         qryParametros.Next;
      End;
      qryParamXEmissor.Close;
      qryParamXEmissor.SQL.Clear;
      qryParamXEmissor.SQL.Add(''+sSQLParamIDEmissor+'');
      qryParamXEmissor.Prepare;
      qryParamXEmissor.Open;

      qryParametros.Close;
      qryParametros.SQL.Clear;
      qryParametros.SQL.Add(''+sSQLParamIDEmissorDisp+'');
      qryParametros.Prepare;
      qryParametros.Open;

      sbtnAssociaParam.Enabled         := not(qryParametros.IsEmpty);
      sbtnAssociaTodosParam.Enabled    := not(qryParametros.IsEmpty);
      sbtnDesassociaParam.Enabled      := not(qryParamXEmissor.IsEmpty);
      sbtnDesassociaTodosParam.Enabled := not(qryParamXEmissor.IsEmpty);
   End;
End;

procedure TfrmAssociaEmissor.AssociaEmissor;
Var
  sSQLParamIDEmissor, sSQLParamIDEmissorDisp, IDEMISSOR,IDPARAMEMISSOR : string;
Begin
   with qryAux do
   begin
      sSQLParamIDEmissor      :=' SELECT DISTINCT                            '+
                                '    PE.IdParamEmissor, P.DescParamEmissor   '+
                                ' FROM                                       '+
                                '    PARAMxEMISSOR PE , PARAMEMISSOR P '+
                                ' WHERE                                      '+
                                ' PE.IdParamEmissor = P.IdParamEmissor AND   '+
                                ' PE.IDPARAMEMISSOR IN (';

      sSQLParamIDEmissorDisp  :=' SELECT DESCPARAMEMISSOR,IDPARAMEMISSOR     '+
                                ' FROM PARAMEMISSOR                       '+
                                ' WHERE IDPARAMEMISSOR NOT IN (              ';
      qryBuscaEmissor.Close;
      qryBuscaEmissor.Open;
      qryEmissorParam.First;
      While Not qryEmissorParam.EOF Do
      Begin
         IDEMISSOR      := qryEmissorParam.FieldByName('IDEMISSOR').AsString;
         IDPARAMEMISSOR := qryParametros.FieldByName('IDPARAMEMISSOR').AsString;
         If (Not qryBuscaEmissor.Locate('IDEMISSOR;IDPARAMEMISSOR',
                     VarArrayOf([IDEMISSOR, IDPARAMEMISSOR]),[loPartialKey])) Then
         Begin
            Close;
            SQL.Clear;
            SQL.Add(' INSERT INTO ' +	Sistema.PrefixoServidor +
                                 'PARAMXEMISSOR(IDEMISSOR,IDPARAMEMISSOR)' );
            SQL.Add(' VALUES('	 +
             	IDEMISSOR+ ',' +IDPARAMEMISSOR+ ')');
            Prepare;
            ExecSQL;
            UnPrepare;
         End;
         sSQLParamIDEmissor      := sSQLParamIDEmissor + IDPARAMEMISSOR+',';
         sSQLParamIDEmissorDisp  := sSQLParamIDEmissorDisp + IDPARAMEMISSOR+',';
         qryEmissorParam.Next;
      End;

      If qryParamXEmissor.RecordCount > 0 Then
      Begin
         qryParamXEmissor.First;
         While Not qryParamXEmissor.EOF Do
         Begin
            sSQLParamIDEmissor      := sSQLParamIDEmissor +
               qryParamXEmissor.FieldByName('IDPARAMEMISSOR').AsString+',';
            sSQLParamIDEmissorDisp  := sSQLParamIDEmissorDisp +
               qryParamXEmissor.FieldByName('IDPARAMEMISSOR').AsString+',';
            qryParamXEmissor.Next;
         End;
      End;
      sSQLParamIDEmissor      :=
          COPY(sSQLParamIDEmissor,1,Length(sSQLParamIDEmissor)-1);
      sSQLParamIDEmissor      := sSQLParamIDEmissor+')';

      sSQLParamIDEmissorDisp  :=
          COPY(sSQLParamIDEmissorDisp,1,Length(sSQLParamIDEmissorDisp)-1);
      sSQLParamIDEmissorDisp  := sSQLParamIDEmissorDisp +')';

      qryParamXEmissor.Close;
      qryParamXEmissor.SQL.Clear;
      qryParamXEmissor.SQL.Add(''+sSQLParamIDEmissor+'');
      qryParamXEmissor.Prepare;
      qryParamXEmissor.Open;

      qryParametros.Close;
      qryParametros.SQL.Clear;
      qryParametros.SQL.Add(''+sSQLParamIDEmissorDisp+'');
      qryParametros.Prepare;
      qryParametros.Open;
      sbtnAssociaParam.Enabled         := not(qryParametros.IsEmpty);
      sbtnAssociaTodosParam.Enabled    := not(qryParametros.IsEmpty);
      sbtnDesassociaParam.Enabled      := not(qryParamXEmissor.IsEmpty);
      sbtnDesassociaTodosParam.Enabled := not(qryParamXEmissor.IsEmpty);
   end;
End;

procedure TfrmAssociaEmissor.sbtnAssociaParamClick(Sender: TObject);
begin
  inherited;
  If qryEmissorParam.RecordCount = 1 Then
  Begin
     AssociaParametro;
     RefazQuerys;
  End
  Else
     AssociaEmissor;
end;

Function TfrmAssociaEmissor.AssociaBolsa:Boolean;
Var
  wSiglaEmissor : String;
begin
  Result := False;
  if dblkBolsas.SelectedItem = '' then begin
    MsgDlg('Não Existe Bolsa Selecionado', 'Aviso', mtError, [mbOk, mbHelp], 0);
    exit;
  end;
// Pede Sigla do Emissor na Bolsa
  wSiglaEmissor:=QryEmissor.FieldByName('SIGLAEMISSOR').AsString;
  If InputQuery('Mensagem do Sistema','Sigla do Emissor na Bolsa (10 Chr.)',
              wSiglaEmissor) = False Then Begin
    Exit;
  End;
// Testa se Sigla Já Existe
  FazQuery(QryAux,'SELECT IDBOLSAVALORES FROM '+Sistema.PrefixoServidor +
                  'EMISSORXBOLSA WHERE '+
                  ' (IDBOLSAVALORES  = '''+QryBolsas.FieldByName('IDBOLSAVALORES').AsString+''') AND '+
                  ' (UPPER(SGLEMISSORBOLSA) = UPPER('''+wSiglaEmissor+ ''')) ');
  If Not QryAux.IsEmpty Then Begin
    ShowMessage('Já existe Emissor com esta Sigla na Bolsa ');
    Exit;
  End;

  with qryAux do begin
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO '+Sistema.PrefixoServidor +
            'EMISSORXBOLSA (IDBOLSAVALORES,IDEMISSOR,SGLEMISSORBOLSA)' );
    SQL.Add(' VALUES('+QryBolsas.FieldByName('IdBolsaValores').AsString+ ',' +
                       QryEmissor.FieldByName('IdEmissor').AsString+ ',''' +
                       Copy(wSiglaEmissor,1,10)+ ''')');

    Prepare;
    ExecSQL;
    UnPrepare;
    Result	:= True;
  end;
end;

function TfrmAssociaEmissor.AssociaParametro:Boolean;
begin
	Result	:= False;
	if dblkParametros.SelectedItem = '' then
   begin
   	MsgDlg('Não Existe Parâmetro Selecionado', 'Aviso', mtError, [mbOk, mbHelp], 0);
      exit;
   end;
   with qryAux do
   begin
      qryEmissor.DisableControls;
      qryEmissor.First;
      While Not qryEmissor.EOF Do
      Begin
         Close;
         SQL.Clear;
         SQL.Add(' INSERT INTO ' +	Sistema.PrefixoServidor +
                                    'PARAMXEMISSOR(IDEMISSOR,IDPARAMEMISSOR)' );
         SQL.Add(' VALUES('	 +
                	qryEmissor.FieldByName('IdEmissor').AsString	+ ',' +
                        qryParametros.FieldByName('IdParamEmissor').AsString	+ ')');
         Prepare;
         ExecSQL;
         UnPrepare;
         qryEmissor.Next;
      End;
      qryEmissor.EnableControls;
      Result	:= True;
   end;
end;

procedure TfrmAssociaEmissor.sbtnAssociaTodosParamClick(Sender: TObject);
begin
   inherited;
  If qryEmissorParam.RecordCount = 1 Then
  Begin
     qryParametros.First;
     while not(qryParametros.Eof) and (AssociaParametro) do
     begin
        qryParametros.Next;
     end;
     RefazQuerys;
  End
  Else
     AssociaTodosEmissor;
end;

procedure TfrmAssociaEmissor.sbtnDesassociaParamClick(Sender: TObject);
begin
  inherited;
  If qryEmissorParam.RecordCount = 1 Then
  Begin
     DesassociaParametro(False);
     RefazQuerys;
  End
  Else
     DesassociaEmissor;
end;

procedure TfrmAssociaEmissor.DesassociaEmissor;
Var
  sSQLParamIDEmissor, sSQLParamIDEmissorDisp, IDEMISSOR,IDPARAMEMISSOR : string;
Begin
   with qryAux do
   begin
      sSQLParamIDEmissor      :=' SELECT DISTINCT                            '+
                                '    PE.IdParamEmissor, P.DescParamEmissor   '+
                                ' FROM                                       '+
                                '    PARAMxEMISSOR PE , PARAMEMISSOR P '+
                                ' WHERE                                      '+
                                ' PE.IdParamEmissor = P.IdParamEmissor AND   '+
                                ' PE.IDPARAMEMISSOR NOT IN (';

      sSQLParamIDEmissorDisp  :=' SELECT DESCPARAMEMISSOR,IDPARAMEMISSOR     '+
                                ' FROM PARAMEMISSOR                       '+
                                ' WHERE IDPARAMEMISSOR  IN (';
      qryBuscaEmissor.Close;
      qryBuscaEmissor.Open;
      qryEmissorParam.First;
      While Not qryEmissorParam.EOF Do
      Begin
         IDEMISSOR      := qryEmissorParam.FieldByName('IDEMISSOR').AsString;
         IDPARAMEMISSOR := qryParamXEmissor.FieldByName('IDPARAMEMISSOR').AsString;
         If (qryBuscaEmissor.Locate('IDEMISSOR;IDPARAMEMISSOR',
                     VarArrayOf([IDEMISSOR, IDPARAMEMISSOR]),[loPartialKey])) Then
         Begin
            Close;
            SQL.Clear;
            SQL.Add('DELETE FROM '+ Sistema.PrefixoServidor +'PARAMXEMISSOR PXE ');
            SQL.Add('WHERE PXE.IDEMISSOR     = '+ IDEMISSOR);
            SQL.Add(' And PXE.IDPARAMEMISSOR = '+ IDPARAMEMISSOR);
            Prepare;
            ExecSQL;
            UnPrepare;
         End;
         qryEmissorParam.Next;
      End;

      sSQLParamIDEmissor      := sSQLParamIDEmissor +
                    qryParamXEmissor.FieldByName('IDPARAMEMISSOR').AsString+',';
      sSQLParamIDEmissorDisp  := sSQLParamIDEmissorDisp +
                   qryParamXEmissor.FieldByName('IDPARAMEMISSOR').AsString+',';

      If qryParametros.RecordCount > 0 Then
      Begin
         qryParametros.First;
         While Not qryParametros.EOF Do
         Begin
            sSQLParamIDEmissor      := sSQLParamIDEmissor +
               qryParametros.FieldByName('IDPARAMEMISSOR').AsString+',';
            sSQLParamIDEmissorDisp  := sSQLParamIDEmissorDisp +
               qryParametros.FieldByName('IDPARAMEMISSOR').AsString+',';
            qryParametros.Next;
         End;
      End;
      sSQLParamIDEmissor      :=
          COPY(sSQLParamIDEmissor,1,Length(sSQLParamIDEmissor)-1);
      sSQLParamIDEmissor      := sSQLParamIDEmissor+')';

      sSQLParamIDEmissorDisp  :=
          COPY(sSQLParamIDEmissorDisp,1,Length(sSQLParamIDEmissorDisp)-1);
      sSQLParamIDEmissorDisp  := sSQLParamIDEmissorDisp +')';

      qryParamXEmissor.Close;
      qryParamXEmissor.SQL.Clear;
      qryParamXEmissor.SQL.Add(''+sSQLParamIDEmissor+'');
      qryParamXEmissor.Prepare;
      qryParamXEmissor.Open;

      qryParametros.Close;
      qryParametros.SQL.Clear;
      qryParametros.SQL.Add(''+sSQLParamIDEmissorDisp+'');
      qryParametros.Prepare;
      qryParametros.Open;
      sbtnAssociaParam.Enabled         := not(qryParametros.IsEmpty);
      sbtnAssociaTodosParam.Enabled    := not(qryParametros.IsEmpty);
      sbtnDesassociaParam.Enabled      := not(qryParamXEmissor.IsEmpty);
      sbtnDesassociaTodosParam.Enabled := not(qryParamXEmissor.IsEmpty);
   end;
End;

procedure TfrmAssociaEmissor.DesassociaParametro(Tudo:Boolean);
begin
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM '+ Sistema.PrefixoServidor +'PARAMXEMISSOR PXE ');
      SQL.Add('WHERE PXE.IDEMISSOR = '+ qryEmissorParam.FieldByName('IdEmissor').AsString );

      if not(Tudo) then
         SQL.Add(' And PXE.IDPARAMEMISSOR ='+
                       qryParamxEmissor.FieldByName('IdParamEmissor').AsString );

      Prepare;
      ExecSQL;
      UnPrepare;
   end;
end;

procedure TfrmAssociaEmissor.DesassociaTodosEmissor;
Var
  sSQLParamIDEmissor, sSQLParamIDEmissorDisp, IDEMISSOR,IDPARAMEMISSOR : string;
Begin
   with qryAux do
   begin
      sSQLParamIDEmissor      :=' SELECT DISTINCT                            '+
                                '    PE.IdParamEmissor, P.DescParamEmissor   '+
                                ' FROM                                       '+
                                '    PARAMxEMISSOR PE , PARAMEMISSOR P '+
                                ' WHERE                                      '+
                                '    PE.IdParamEmissor = P.IdParamEmissor AND'+
                                '    PE.IdParamEmissor = -1                  ';

      sSQLParamIDEmissorDisp  :=' SELECT DESCPARAMEMISSOR,IDPARAMEMISSOR     '+
                                ' FROM PARAMEMISSOR                       ';
      qryBuscaEmissor.Close;
      qryBuscaEmissor.Open;
      qryParamXEmissor.First;
      While Not qryParamXEmissor.EOF Do
      Begin
         qryEmissorParam.First;
         While Not qryEmissorParam.EOF Do
         Begin
            IDEMISSOR      := qryEmissorParam.FieldByName('IDEMISSOR').AsString;
            IDPARAMEMISSOR := qryParamXEmissor.FieldByName('IDPARAMEMISSOR').AsString;
            If (qryBuscaEmissor.Locate('IDEMISSOR;IDPARAMEMISSOR',
                   VarArrayOf([IDEMISSOR, IDPARAMEMISSOR]),[loPartialKey])) Then
            Begin
               Close;
               SQL.Clear;
               SQL.Add('DELETE FROM '+ Sistema.PrefixoServidor +'PARAMXEMISSOR PXE ');
               SQL.Add('WHERE PXE.IDEMISSOR     = '+ IDEMISSOR);
               SQL.Add(' And PXE.IDPARAMEMISSOR = '+ IDPARAMEMISSOR);
               Prepare;
               ExecSQL;
               UnPrepare;
            End;
            qryEmissorParam.Next;
         End;
         qryParamXEmissor.Next;
      End;
      qryParamXEmissor.Close;
      qryParamXEmissor.SQL.Clear;
      qryParamXEmissor.SQL.Add(''+sSQLParamIDEmissor+'');
      qryParamXEmissor.Prepare;
      qryParamXEmissor.Open;

      qryParametros.Close;
      qryParametros.SQL.Clear;
      qryParametros.SQL.Add(''+sSQLParamIDEmissorDisp+'');
      qryParametros.Prepare;
      qryParametros.Open;

      sbtnAssociaParam.Enabled         := not(qryParametros.IsEmpty);
      sbtnAssociaTodosParam.Enabled    := not(qryParametros.IsEmpty);
      sbtnDesassociaParam.Enabled      := not(qryParamXEmissor.IsEmpty);
      sbtnDesassociaTodosParam.Enabled := not(qryParamXEmissor.IsEmpty);
   End;
End;

procedure TfrmAssociaEmissor.sbtnDesassociaTodosParamClick(Sender: TObject);
begin
  inherited;
   If qryEmissorParam.RecordCount = 1 Then
   Begin
      DesassociaParametro(True);
      RefazQuerys;
   End
   Else
      DesassociaTodosEmissor;
end;

// ********************* FUNCOES DE DRAG - Parametros ***************** */

procedure TfrmAssociaEmissor.dblkparametrosDragDrop(Sender,
 Source: TObject; X, Y: Integer);
begin
	inherited;
	TDBLookUpListBox(Sender).EndDrag(True);
	sbtnDesassociaParamClick(Sender);
end;

procedure TfrmAssociaEmissor.dblkparametrosDragOver(Sender,
 Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
	inherited;
	Accept := (Source = dblkParamXEmissor);
end;

procedure TfrmAssociaEmissor.dblkparametrosMouseDown(Sender: TObject;
 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	inherited;
	if Sender is TDBLookUpListBox then
  		TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TfrmAssociaEmissor.dbgrdParamXEmissorDragDrop(Sender,
 Source: TObject; X, Y: Integer);
begin
	inherited;
	TdbLookUpListBox(Sender).EndDrag(True);
	sbtnAssociaParamClick(Sender);
end;

procedure TfrmAssociaEmissor.dbgrdParamXEmissorMouseDown(Sender: TObject;
 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	inherited;
	if Button = mbLeft then
		if Sender is TwwDBGrid then
   		TwwDBGrid(Sender).BeginDrag(True);
end;

// ********************* FUNCOES DE ASSOCIAÇÃO - Bolsas ***************** */

procedure TfrmAssociaEmissor.sbtnAssociaBolsaClick(Sender: TObject);
begin
	inherited;
	AssociaBolsa;
	RefazQuerys;
end;

procedure TfrmAssociaEmissor.sbtnAssociaTodasBolsasClick(Sender: TObject);
begin
  inherited;
  qryBolsas.First;
  while not (qryBolsas.Eof) and (AssociaBolsa) do begin
    qryBolsas.Next;
  end;
  RefazQuerys;
end;

procedure TfrmAssociaEmissor.sbtnDesassociaBolsaClick(Sender: TObject);
begin
	inherited;
	DesassociaBolsa(False);
   RefazQuerys;
end;

procedure TfrmAssociaEmissor.sbtnDesassociaTodasBolsasClick(
  Sender: TObject);
begin
   inherited;
    DesassociaBolsa(True);
    RefazQuerys;
end;

procedure TfrmAssociaEmissor.DesassociaBolsa(Tudo:Boolean);
var
   PodeExecutar	:Boolean;
begin
   if not(Tudo) and (dblckEmissorXBolsas.SelectedItem = '') then
   begin
      MsgDlg('Não Existe Bolsa Selecionada', 'Aviso', mtError, [mbOk, mbHelp], 0);
      exit;
   end;

   PodeExecutar	:= True;
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM '+ Sistema.PrefixoServidor +'EMISSORXBOLSA EXB ');
      SQL.Add('WHERE  EXB.IDEMISSOR = ' + qryEmissorXBolsas.FieldByName('IdEmissor').AsString );

      if not(Tudo) then
      begin
      	PodeExecutar	:= not(ExisteAcao);
         SQL.Add(' And EXB.IDBOLSAVALORES = ' + qryEmissorXBolsas.FieldByName('IdBolsaValores').AsString );
      end
      else
      	MsgDlg('Bolsas com Ações Negociadas não Poderão ser Desassociadas.','Desassociação Não Permitida',mtError,[mbOk],0);

      if PodeExecutar then
      begin
      	Prepare;
         ExecSQL;
      end;
   end;
end;

// ********************* FUNCOES DE DRAG - Bolsa de Valores ***************** */

procedure TfrmAssociaEmissor.dblkBolsasDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
	inherited;
	TDBLookUpListBox(Sender).EndDrag(True);
	sbtnDesassociaBolsaClick(Sender);
end;

procedure TfrmAssociaEmissor.dblkBolsasDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
	inherited;
	Accept := (Source = dblckEmissorXBolsas);
end;

procedure TfrmAssociaEmissor.dblkBolsasMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
	inherited;
	if Sender = dblkBolsas then
  		TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TfrmAssociaEmissor.dblkParamXEmissorDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
	inherited;
	Accept := (Source = dblkparametros);
end;

procedure TfrmAssociaEmissor.dblckEmissorXBolsasDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
	inherited;
   Accept := (Source = dblkBolsas);
end;

procedure TfrmAssociaEmissor.dblckEmissorXBolsasDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
	inherited;
	TDBLookUpListBox(Sender).EndDrag(True);
	sbtnAssociaBolsaClick(Sender);
end;

procedure TfrmAssociaEmissor.dblkParamXEmissorDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
	inherited;
	TDBLookUpListBox(Sender).EndDrag(True);
	sbtnAssociaParamClick(Sender);
end;

procedure TfrmAssociaEmissor.dblckEmissorXBolsasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	inherited;
	if Sender = dblckEmissorXBolsas then
  		TDBLookUplistBox(Sender).BeginDrag(True);

end;

procedure TfrmAssociaEmissor.sbtnAssociaEmissorClick(Sender: TObject);
Var
   sIDPESSOA : String;
begin
  inherited;
  if dblkEmissor.SelectedItem = '' then begin
    MsgDlg('Não Existe Emissor.', 'Aviso', mtError, [mbOk, mbHelp], 0);
    exit;
  end;
  If (iVez = 0) Then
  Begin
     sSQLEmissor := 'SELECT                            '+
             '     P.IDPESSOA,                         '+
             '     P.NOME,                             '+
             '     P.RAZAOSOCIAL,                      '+
             '     E.SIGLAEMISSOR,                     '+
             '     E.IDEMISSOR                         '+
             'FROM                                     '+
             '     PESSOA P , EMISSOR E          '+
             'WHERE                                    '+
             '     E.IDEMISSOR = P.IDPESSOA AND        '+
             '     E.IDEMISSOR NOT IN                  '+
             '          (SELECT                        '+
             '                IDPESSOA                 '+
             '           FROM                          '+
             '               PESSOA                    '+
             '           WHERE                         '+
             '              IDPESSOA IN ('+
                      qryEmissor.FieldByName('IDPESSOA').AsString+' ))'+
             '  ORDER BY P.NOME';
  End
  Else
  Begin
      sSQLEmissor := COPY(sSQLEmissor,1,Length(sSQLEmissor)-20);
      sSQLEmissor := sSQLEmissor + ','+qryEmissor.FieldByName('IDPESSOA').AsString+' ))';
      sSQLEmissor := sSQLEmissor + '  ORDER BY P.NOME';
  End;
  bTodosEmi := True;
  FazQuery(qryEmissor,sSQLEmissor);
  sSQLEmissorParam := 'SELECT                       '+
          '     P.IDPESSOA,                         '+
          '     P.NOME,                             '+
          '     P.RAZAOSOCIAL,                      '+
          '     E.SIGLAEMISSOR,                     '+
          '     E.IDEMISSOR                         '+
          'FROM                                     '+
          '     PESSOA P , EMISSOR E          '+
          'WHERE                                    '+
          '     E.IDEMISSOR = P.IDPESSOA  AND       '+
          '     E.IDEMISSOR NOT IN                  '+
          '          (SELECT                        '+
          '                IDPESSOA                 '+
          '           FROM                          '+
          '               PESSOA                    '+
          '           WHERE                         '+
          '               IDPESSOA IN())'+
          '  ORDER BY P.NOME';
  qryEmissor.First;
  sSQLEmissorParam := COPY(sSQLEmissorParam,1,Length(sSQLEmissorParam)-19);
  While Not qryEmissor.EOF DO
  Begin
      sSQLEmissorParam := sSQLEmissorParam +
                          qryEmissor.FieldByName('IDPESSOA').AsString+',';
      qryEmissor.Next;
  End;
  qryEmissor.First;
  sSQLEmissorParam := COPY(sSQLEmissorParam,1,Length(sSQLEmissorParam)-1)+'))';
  sSQLEmissorParam := sSQLEmissorParam + '  ORDER BY P.NOME';
  FazQuery(qryEmissorParam,sSQLEmissorParam);

  If qryEmissorParam.RecordCount = 1 Then
  Begin
     With qryParamXEmissor Do
     Begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT PE.IdParamEmissor, P.DescParamEmissor            ');
        SQL.Add('FROM   PARAMxEMISSOR PE , PARAMEMISSOR P          ');
        SQL.Add('WHERE  PE.IdParamEmissor = P.IdParamEmissor AND         ');
        SQL.Add('       IdEmissor = '+qryEmissor.FieldByName('IdEmissor').AsString);
        Open;
     End;

     With qryParametros Do
     Begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT DESCPARAMEMISSOR,IDPARAMEMISSOR                 ');
        SQL.Add('FROM PARAMEMISSOR                                   ');
        SQL.Add('WHERE IDPARAMEMISSOR NOT IN                            ');
        SQL.Add('(SELECT IDPARAMEMISSOR                                 ');
        SQL.Add(' FROM PARAMXEMISSOR                                 ');
        SQL.Add(' WHERE                                                 ');
        SQL.Add('   IdEmissor = '+qryEmissor.FieldByName('IdEmissor').AsString+')');
        Open;
     End;
  End
  Else
  Begin
     With qryParamXEmissor Do
     Begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT PE.IdParamEmissor, P.DescParamEmissor            ');
        SQL.Add('FROM   PARAMxEMISSOR PE , PARAMEMISSOR P          ');
        SQL.Add('WHERE  PE.IdParamEmissor = P.IdParamEmissor AND         ');
        SQL.Add('       IdEmissor = -1                                   ');
        Open;
     End;
     With qryParametros Do
     Begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT DESCPARAMEMISSOR,IDPARAMEMISSOR                 ');
        SQL.Add('FROM PARAMEMISSOR                                   ');
        SQL.Add('WHERE IDPARAMEMISSOR NOT IN                            ');
        SQL.Add('(SELECT IDPARAMEMISSOR                                 ');
        SQL.Add(' FROM PARAMXEMISSOR                                 ');
        SQL.Add(' WHERE IDEMISSOR = -1)                                 ');
        Open;
     End;
  End;

//  sbtnDesassociaEmissor.Enabled       := not(qryEmissorParam.IsEmpty);
  sbtnDesassociaTodosEmissor.Enabled  := not(qryEmissorParam.IsEmpty);
  iVez := iVez + 1;
end;

procedure TfrmAssociaEmissor.FormShow(Sender: TObject);
begin
  inherited;
  iVez   := 0;
  iVolta := 0;
  bTodosEmi := False;  
end;

procedure TfrmAssociaEmissor.sbtnAssociaTodosEmissorClick(Sender: TObject);
begin
  inherited;
   if dblkEmissor.SelectedItem = '' then begin
      MsgDlg('Não Existe Emissor.', 'Aviso', mtError, [mbOk, mbHelp], 0);
      exit;
   end;
   sSQLEmissorParam := 'SELECT                         '+
             '     P.IDPESSOA,                         '+
             '     P.NOME,                             '+
             '     P.RAZAOSOCIAL,                      '+
             '     E.SIGLAEMISSOR,                     '+
             '     E.IDEMISSOR                         '+
             'FROM                                     '+
             '     PESSOA P , EMISSOR E          '+
             'WHERE                                    '+
             '     E.IDEMISSOR = P.IDPESSOA            '+
             '  ORDER BY P.NOME                        ';

   sSQLEmissor := 'SELECT                              '+
             '     P.IDPESSOA,                         '+
             '     P.NOME,                             '+
             '     P.RAZAOSOCIAL,                      '+
             '     E.SIGLAEMISSOR,                     '+
             '     E.IDEMISSOR                         '+
             'FROM                                     '+
             '     PESSOA P , EMISSOR E          '+
             'WHERE                                    '+
             '     E.IDEMISSOR = P.IDPESSOA AND        '+
             '     E.IDEMISSOR = -1                    '+
             '  ORDER BY P.NOME                        ';

  FazQuery(qryEmissorParam,sSQLEmissorParam);
  FazQuery(qryEmissor,sSQLEmissor);
  bTodosEmi := True;
//  sbtnDesassociaEmissor.Enabled       := not(qryEmissorParam.IsEmpty);
  sbtnDesassociaTodosEmissor.Enabled  := not(qryEmissorParam.IsEmpty);
  iVez := 0;
end;

procedure TfrmAssociaEmissor.sbtnDesassociaEmissorClick(Sender: TObject);
begin
  inherited;
   sSQLEmissor := COPY(sSQLEmissor,1,Length(sSQLEmissor)-20);
   sSQLEmissor := sSQLEmissor + ','+qryEmissorParam.FieldByName('IDPESSOA').AsString+' ))';
   sSQLEmissor := sSQLEmissor + '  ORDER BY P.NOME';
  FazQuery(qryEmissor,sSQLEmissor);

  sSQLEmissorParam := 'SELECT                       '+
          '     P.IDPESSOA,                         '+
          '     P.NOME,                             '+
          '     P.RAZAOSOCIAL,                      '+
          '     E.SIGLAEMISSOR,                     '+
          '     E.IDEMISSOR                         '+
          'FROM                                     '+
          '     PESSOA P , EMISSOR E          '+
          'WHERE                                    '+
          '     E.IDEMISSOR = P.IDPESSOA  AND       '+
          '     E.IDEMISSOR NOT IN                  '+
          '          (SELECT                        '+
          '                IDPESSOA                 '+
          '           FROM                          '+
          '               PESSOA                    '+
          '           WHERE                         '+
          '               IDPESSOA IN())'+
          '  ORDER BY P.NOME';
  qryEmissor.First;
  sSQLEmissorParam := COPY(sSQLEmissorParam,1,Length(sSQLEmissorParam)-19);
  While Not qryEmissor.EOF DO
  Begin
      sSQLEmissorParam := sSQLEmissorParam +
                          qryEmissor.FieldByName('IDPESSOA').AsString+',';
      qryEmissor.Next;
  End;
  qryEmissor.First;  
  sSQLEmissorParam := COPY(sSQLEmissorParam,1,Length(sSQLEmissorParam)-1)+'))';
  sSQLEmissorParam := sSQLEmissorParam + '  ORDER BY P.NOME';
  FazQuery(qryEmissorParam,sSQLEmissorParam);
  iVez   := iVez + 1;
  iVolta := 1;
end;

procedure TfrmAssociaEmissor.sbtnDesassociaTodosEmissorClick(Sender: TObject);
Var
  sSQLParamIDEmissor, sSQLParamIDEmissorDisp : string;
begin
  inherited;
   if dblkEmissorParam.SelectedItem = '' then begin
      MsgDlg('Não Existe Emissor.', 'Aviso', mtError, [mbOk, mbHelp], 0);
      exit;
   end;
   sSQLParamIDEmissor      :=' SELECT DISTINCT                            '+
                             '    PE.IdParamEmissor, P.DescParamEmissor   '+
                             ' FROM                                       '+
                             '    PARAMxEMISSOR PE , PARAMEMISSOR P '+
                             ' WHERE                                      '+
                             '    PE.IdParamEmissor = P.IdParamEmissor AND'+
                             '    PE.IdParamEmissor = -1                  ';

   sSQLParamIDEmissorDisp  :=' SELECT DESCPARAMEMISSOR,IDPARAMEMISSOR     '+
                             ' FROM PARAMEMISSOR                       ';


   sSQLEmissorParam := 'SELECT                         '+
             '     P.IDPESSOA,                         '+
             '     P.NOME,                             '+
             '     P.RAZAOSOCIAL,                      '+
             '     E.SIGLAEMISSOR,                     '+
             '     E.IDEMISSOR                         '+
             'FROM                                     '+
             '     PESSOA P , EMISSOR E          '+
             'WHERE                                    '+
             '     E.IDEMISSOR = P.IDPESSOA AND        '+
             '     E.IDEMISSOR = -1                    '+
             '  ORDER BY P.NOME                        ';

   sSQLEmissor := 'SELECT                              '+
             '     P.IDPESSOA,                         '+
             '     P.NOME,                             '+
             '     P.RAZAOSOCIAL,                      '+
             '     E.SIGLAEMISSOR,                     '+
             '     E.IDEMISSOR                         '+
             'FROM                                     '+
             '     PESSOA P , EMISSOR E          '+
             'WHERE                                    '+
             '     E.IDEMISSOR = P.IDPESSOA            '+
             '  ORDER BY P.NOME                        ';

   qryParamXEmissor.Close;
   qryParametros.Close;
   qryEmissor.Close;
   qryEmissorParam.Close;

   qryEmissorParam.SQL.Clear;
   qryEmissorParam.SQL.Add(''+sSQLEmissorParam+'');
   qryEmissorParam.Prepare;
   qryEmissorParam.Open;

   qryEmissor.SQL.Clear;
   qryEmissor.SQL.Add(''+sSQLEmissor+'');
   qryEmissor.Prepare;
   qryEmissor.Open;

   qryParamXEmissor.Close;
   qryParamXEmissor.SQL.Clear;
   qryParamXEmissor.SQL.Add(''+sSQLParamIDEmissor+'');
   qryParamXEmissor.Prepare;
   qryParamXEmissor.Open;

   qryParametros.Close;
   qryParametros.SQL.Clear;
   qryParametros.SQL.Add(''+sSQLParamIDEmissorDisp+'');
   qryParametros.Prepare;
   qryParametros.Open;

  sbtnAssociaParam.Enabled         := not(qryParametros.IsEmpty);
  sbtnAssociaTodosParam.Enabled    := not(qryParametros.IsEmpty);
  sbtnDesassociaParam.Enabled      := not(qryParamXEmissor.IsEmpty);
  sbtnDesassociaTodosParam.Enabled := not(qryParamXEmissor.IsEmpty);
  bTodosEmi := True;
//  sbtnDesassociaEmissor.Enabled       := False;
  sbtnDesassociaTodosEmissor.Enabled  := False;;
  iVez := 0;
end;

procedure TfrmAssociaEmissor.qryEmissorAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If Not bTodosEmi Then
	RefazQuerys;
end;

//     qryEMISSORxPARAM
{
SELECT distinct
PE.IdParamEmissor,P.DescParamEmissor, PE.IdEmissor
from PARAMxEMISSOR PE , PARAMEMISSOR P
where
  PE.IdParamEmissor = P.IdParamEmissor AND
 (PE.IdEmissor = 1524190 or PE.IdEmissor = 1205007)
}

end.
