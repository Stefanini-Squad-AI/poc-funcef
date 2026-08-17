unit fCadTabelaLonga;

// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Spin, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Menus, DBGrids, CmEventosCadastro, ImgList,
  uSistema;

type
  TfrmCadTabelaLonga = class(TfrmCadMestreDetalheCS)
    dedNome: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    wwDBEdit2: TwwDBEdit;
    Label3: TLabel;
    Spin: TSpinEdit;
    QryDet: TwwQuery;
    updDet: TUpdateSQL;
    QryCmp: TwwQuery;
    dsCmp: TwwDataSource;
    updCmp: TUpdateSQL;
    QryCmpIDTABELA: TFloatField;
    QryCmpIDCAMPO: TFloatField;
    QryCmpDESCRICAO: TStringField;
    ppmTab: TPopupMenu;
    IncluirCampo1: TMenuItem;
    AlterarCampo1: TMenuItem;
    VisualizarCampos1: TMenuItem;
    ExcluirCampo1: TMenuItem;
    dbgrpcmp: TDBGrid;
    dbgrdDetIButton: TwwIButton;
    Toolbar972: TToolbar97;
    SbtnCopiar: TToolbarButton97;
    QryCopia: TwwQuery;
    BitBtnExportar: TBitBtn;
    SD: TSaveDialog;
    MemHelp: TMemo;
    QryAux: TwwQuery;
    procedure VisualizarCampos1Click(Sender: TObject);
    procedure AlterarCampo1Click(Sender: TObject);
    procedure IncluirCampo1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure SbtnCopiarClick(Sender: TObject);
    procedure BitBtnExportarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbgrdDetKeyPress(Sender: TObject; var Key: Char);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure QryDetBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Sel( n : LongInt );
  public
    { Public declarations }
  end;

var
  frmCadTabelaLonga: TfrmCadTabelaLonga;
  vInclui, IsDetail : Boolean;
  vId : LongInt;
  sProxReg : String;

implementation

uses Udatabase, UMensErro, fAguarde, uBiblioteca;

{$R *.DFM}

procedure TfrmCadTabelaLonga.Sel( n : LongInt );
var
   i : LongInt;
Begin
   frmAguarde.Mostra('Abrindo Tabelas ...');
   frmAguarde.Refresh;

   with qry do begin
        Close;
        Params[0].Value := n;
        Open;
   end;

   with QryCmp do begin
        Close;
        Params[0].Value := n;
        Open;
   end;

   with QryDet do begin
        Close;
        Params[0].Value := n;
        Open;
   end;

   For i:= 0 to 101 do
       QryDet.fields[i].visible:=false;

   QryCmp.First;
   i := 0;
   while not QryCmp.EOF do begin
     if QryCmp.FieldbyName('IDCAMPO').AsInteger > 0 then begin
       QryDet.Fields[QryCmp.FieldbyName('IDCAMPO').AsInteger+1].Visible := True;
       QryDet.Fields[QryCmp.FieldbyName('IDCAMPO').AsInteger+1].Displaylabel :=
         QryCmp.FieldbyName('DESCRICAO').AsString;
       inc(i);
     end;
     QryCmp.Next;
   end;

   Spin.Value := i;

   frmAguarde.Apaga;
End;

procedure TfrmCadTabelaLonga.CmeCadastroInsert(Sender: TObject);
var
   i : LongInt;
begin
     Inherited;
     vId := LeUltRegistro(nil, 'LONGTABGENER');
     Qry.FieldbyName('IDTABELA').AsInteger := vId;

     with QryCmp do begin
          Close;
          Params[0].Value := vId;
          Open;
     end;

     with QryDet do begin
          Close;
          Params[0].Value := vId;
          Open;
     end;

     for i:= 2 to 101 do
         QryDet.fields[i].visible := false;

     QryCmp.First;
     i := 0;
     while not QryCmp.EOF do begin
           if QryCmp.FieldbyName('IDCAMPO').AsInteger > 0 then begin
              QryDet.fields[QryCmp.FieldbyName('IDCAMPO').AsInteger+1].visible := True;
              QryDet.fields[QryCmp.FieldbyName('IDCAMPO').AsInteger+1].displaylabel := QryCmp.FieldbyName('DESCRICAO').AsString;
              inc(i);
           end;
           QryCmp.Next;
     end;
     Spin.Value := i;

     dedNome.SetFocus;
end;

procedure TfrmCadTabelaLonga.CmeCadastroEdit(Sender: TObject);
begin
     Inherited;
     dedNome.SetFocus;
     vId := Qry.FieldbyName('IDTABELA').AsInteger;
end;

procedure TfrmCadTabelaLonga.CmeCadastroFind(Sender: TObject);
begin
     Inherited;
     If MontaSelect.RetornouValor Then begin
        Refresh;
        vId := StrToInt(MontaSelect.ValoresChave[0]);
        Sel(vId);
     end;
end;

procedure TfrmCadTabelaLonga.CmeCadastroConfirma(Sender: TObject);
begin
  If qry.State in [dsEdit,dsInsert] Then
       If (Trim(dedNome.Text) = '') Then
          MsgDlg('Existem campos em branco.','Erro',mtError,[mbOK],0)
       Else Begin
            Inherited;
       End
  Else
     Inherited;
end;

procedure TfrmCadTabelaLonga.VisualizarCampos1Click(Sender: TObject);
begin
  inherited;
  if IncluirCampo1.Visible then begin
     IncluirCampo1.Visible := False;
     AlterarCampo1.Visible := False;
     ExcluirCampo1.Visible := False;
     sbtnInsDet.Enabled := False;
     sbtnAltDet.Enabled := False;
     VisualizarCampos1.Caption := '&Voltar';
     dbgrpcmp.BringToFront;
     IsDetail := False;
     QryCmp.Close;
     QryCmp.Open;
  end else begin
     IncluirCampo1.Visible := True;
     AlterarCampo1.Visible := True;
     ExcluirCampo1.Visible := True;
     sbtnInsDet.Enabled := True;
     sbtnAltDet.Enabled := True;
     VisualizarCampos1.Caption := '&Visualizar Campos';
     dbgrdDet.BringToFront;
     IsDetail := True;
  end;
end;

procedure TfrmCadTabelaLonga.AlterarCampo1Click(Sender: TObject);
var
   NomeOld : String;
begin
  inherited;
  NomeOld := dbgrdDet.SelectedField.DisplayLabel;
  dbgrdDet.SelectedField.DisplayLabel := InputBox('Nomear campo','Informe o nome do campo:', NomeOld);
  if qryCmp.Locate('IDTABELA;DESCRICAO',vararrayof([vId,NomeOld]),[]) then begin
     QryCmp.Edit;
     QryCmp.FieldByName('descricao').asstring := UpperCase(dbgrdDet.SelectedField.DisplayLabel);
     try
        QryCmp.Post;
        QryCmp.ApplyUpdates;
     except
           begin
                MsgDlg('Erro na gravação do tipo de campo !','Erro',mtError,[mbOK],0);
                dbgrdDet.SelectedField.DisplayLabel := NomeOld;
                Exit;
           end;
     end;
  end;
end;

procedure TfrmCadTabelaLonga.IncluirCampo1Click(Sender: TObject);
var
   I, Numero : LongInt;
   NomeNew, NomeOld : String;
begin
  inherited;
  Spin.Value := Spin.Value + 1;

  Numero := 2;
  for i:= 101 downto 2 do begin
      if QryDet.Fields[i].Visible then begin
         Numero := i + 1;
         Break;
      end;
  end;

  QryDet.Fields[Numero].Visible := True;
  NomeOld := QryDet.Fields[Numero].DisplayLabel;
  NomeNew := InputBox('Nomear campo','Informe o nome do campo:', NomeOld);
  NomeNew := UpperCase(NomeNew);
  QryDet.Fields[Numero].DisplayLabel := NomeNew;

  if not qryCmp.Locate('IDTABELA;IDCAMPO',vararrayof([vId,Numero - 1]),[]) then begin
     QryCmp.Insert;
     QryCmp.FieldbyName('IDTABELA').AsInteger := vId;
     QryCmp.FieldbyName('IDCAMPO').AsInteger  := Numero - 1;
     QryCmp.FieldbyName('DESCRICAO').AsString := NomeNew;
     try
        QryCmp.post;
        QryCmp.ApplyUpdates;
     except
           begin
                MsgDlg('Erro na gravação do tipo de campo !','Erro',mtError,[mbOK],0);
                QryCmp.Cancel;
                QryCmp.CancelUpdates;
                QryDet.Fields[Numero].Visible := False;
                Spin.Value := Spin.Value - 1;
                Exit;
           end;
     end;
  end;
end;

procedure TfrmCadTabelaLonga.FormCreate(Sender: TObject);
begin
  inherited;

  //Jéssica Lana SOL 109421 KINTANA 496332
  SD.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  IsDetail := True;
end;

procedure TfrmCadTabelaLonga.sbtnExcluiDetClick(Sender: TObject);
var
   i : LongInt;
begin
  if not IsDetail then begin
     QryCmp.Last;
     if (MsgDlg('Deseja excluir campo '+QryCmp.FieldbyName('DESCRICAO').AsString+' ?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then begin
        QryCmp.Delete;

        for i := 2 to 101 do
            QryDet.fields[i].visible:=false;

        QryCmp.First;
        //i := 0;
        while not QryCmp.EOF do begin
              if QryCmp.FieldbyName('IDCAMPO').AsInteger > 0 then begin
                 QryDet.fields[QryCmp.FieldbyName('IDCAMPO').AsInteger+1].visible := True;
                 QryDet.fields[QryCmp.FieldbyName('IDCAMPO').AsInteger+1].displaylabel := QryCmp.FieldbyName('DESCRICAO').AsString;
                 //inc(i);
              end;
              QryCmp.Next;
        end;
        Spin.Value := Spin.Value - 1;
     end;
  end else begin
     if (MsgDlg('Deseja excluir linha da tabela ?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
        QryDet.Delete;
  end;
  sbtnExcluiDet.Down := False;
end;

procedure TfrmCadTabelaLonga.sbtnInsDetClick(Sender: TObject);
begin
  sProxReg := '0';
  QryDet.Append;
  QryDet.FieldbyName('IDTABELA').AsInteger := vId;
  tb97Detalhe.Visible := True;
  sbtnInsDet.Down := False;
end;

procedure TfrmCadTabelaLonga.sbtnAltDetClick(Sender: TObject);
begin
  QryDet.Edit;
  QryDet.FieldbyName('IDTABELA').AsInteger := vId;
  tb97Detalhe.Visible := True;
  sbtnAltDet.Down := False;
end;

procedure TfrmCadTabelaLonga.dbgrdDetDblClick(Sender: TObject);
var
   Numero : LongInt;
   Campo, Valor, Aux : String;
begin
     if qryDet.State in ([dsInsert,dsEdit]) then begin
        Numero := dbgrdDet.SelectedIndex;
        if Numero > 0 then begin
           Campo := QryDet.fields[Numero].displaylabel;
           Valor := QryDet.fields[Numero].AsString;
           Aux := InputBox(Campo,'Informe o Valor :', Valor);
           if Valor <> Aux then
              QryDet.fields[Numero].AsString :=UpperCase(Aux);
        end else begin
            MsgDlg('Este Campo não pode ser usado !','Erro',mtError,[mbOK],0);
        end;
     end;
end;

procedure TfrmCadTabelaLonga.bbtnConfirmarClick(Sender: TObject);
begin
     dbgrdDet.PopupMenu := nil;
     dbgrpcmp.PopupMenu := nil;
     { Grava Log da operação - 19/12/2002 }
     If Not Sistema.GravaLogOperacoes('Manutenção do Cadastro Tabelas Longas') Then
       Raise Exception.Create('Não Consegui Gravar o Log');
     AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
     AplicaAlteracoes([TDBDataSet(dsCmp.DataSet)]);
     AplicaAlteracoes([TDBDataSet(dsDet.DataSet)]);
     MemHelp.Visible := False;
     inherited;
     if not vInclui then
        vInclui := False;
end;

procedure TfrmCadTabelaLonga.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dbgrdDet.PopupMenu := ppmTab;
  dbgrpcmp.PopupMenu := ppmTab;
  MemHelp.Visible := True;
  if Qry.State = dsInsert then begin
     vInclui := True;
     AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
     Qry.Edit;
  end;
end;

procedure TfrmCadTabelaLonga.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  dbgrdDet.PopupMenu := ppmTab;
  dbgrpcmp.PopupMenu := ppmTab;
  MemHelp.Visible := True;
  vInclui := False;
end;

procedure TfrmCadTabelaLonga.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dbgrdDet.PopupMenu := nil;
  dbgrpcmp.PopupMenu := nil;
  MemHelp.Visible := False;
  if vInclui then begin
     AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
     Qry.Delete;
     AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
     Sel(-8940);
  end;
  vInclui := False;
end;

procedure TfrmCadTabelaLonga.SbtnCopiarClick(Sender: TObject);
var
   vSql : String;
   vNew : LongInt;
begin
  inherited;
  if (MsgDlg('Deseja copiar tabela ?', 'Copia', mtConfirmation, [mbYes,mbNo],0) = mrNo) then begin
     SbtnCopiar.Down := False;
     Exit;
  end;

  qryDet.DisableControls;

  frmAguarde.Mostra('Verificando sequence ...');
  frmAguarde.Refresh;

  vNew := LeUltRegistro(nil, 'LONGTABGENER');
  while Qry.Locate('IDTABELA',InttoStr(vNew),[]) do
        vNew := LeUltRegistro(nil, 'LONGTABGENER');

  frmAguarde.Mostra('Copiando tabela ... (1)');
  frmAguarde.Refresh;

  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := QryCmp.RecordCount + qryDet.RecordCount + 1;


  with QryCopia do begin
       Close;
       Sql.Clear;
       vSql := 'INSERT INTO LONGTABGENER (IDTABELA, DESCRICAO) '+
               'VALUES ('+InttoStr(vNew)+', '''+'Cópia '+qry.FieldbyName('DESCRICAO').AsString+''')';
       Sql.Add(vSql);
       ExecSql;
       frmAguarde.Pos := frmAguarde.Pos + 1;
       frmAguarde.Refresh;


       frmAguarde.Mostra('Copiando tabela ... (2)');
       frmAguarde.Refresh;

       QryCmp.First;
       while not QryCmp.Eof do begin
             Close;
             Sql.Clear;
             vSql := 'INSERT INTO LONGCMPTABGENER (IDTABELA, IDCAMPO, DESCRICAO) '+
                     'VALUES ('+InttoStr(vNew)+', '+QryCmp.FieldbyName('IDCAMPO').AsString+', '''+
                     QryCmp.FieldbyName('DESCRICAO').AsString+''')';
             Sql.Add(vSql);
             ExecSql;
             frmAguarde.Pos := frmAguarde.Pos + 1;
             frmAguarde.Refresh;
             QryCmp.Next;
       end;

       frmAguarde.Mostra('Copiando tabela ... (3)');
       frmAguarde.Refresh;

       while not QryDet.Eof do begin
             Close;
             Sql.Clear;
             vSql := 'INSERT INTO LONGVALTABGENER '+
                     '(IDTABELA, NUMLINHA, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12,'+
                     'C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26,'+
                     'C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39, C40,'+
                     'C41, C42, C43, C44, C45, C46, C47, C48, C49, C50, C51, C52, C53, C54,'+
                     'C55, C56, C57, C58, C59, C60, C61, C62, C63, C64, C65, C66, C67, C68,'+
                     'C69, C70, C71, C72, C73, C74, C75, C76, C77, C78, C79, C80, C81, C82,'+
                     'C83, C84, C85, C86, C87, C88, C89, C90, C91, C92, C93, C94, C95, C96,'+
                     'C97, C98, C99, C100) VALUES '+
                     '('+InttoStr(vNew)+','+QryDet.FieldbyName('NUMLINHA').AsString+
                     ','''+QryDet.FieldbyName('C1').AsString+''''+
                     ','''+QryDet.FieldbyName('C2').AsString+''''+
                     ','''+QryDet.FieldbyName('C3').AsString+''''+
                     ','''+QryDet.FieldbyName('C4').AsString+''''+
                     ','''+QryDet.FieldbyName('C5').AsString+''''+
                     ','''+QryDet.FieldbyName('C6').AsString+''''+
                     ','''+QryDet.FieldbyName('C7').AsString+''''+
                     ','''+QryDet.FieldbyName('C8').AsString+''''+
                     ','''+QryDet.FieldbyName('C9').AsString+''''+
                     ','''+QryDet.FieldbyName('C10').AsString+''''+
                     ','''+QryDet.FieldbyName('C11').AsString+''''+
                     ','''+QryDet.FieldbyName('C12').AsString+''''+
                     ','''+QryDet.FieldbyName('C13').AsString+''''+
                     ','''+QryDet.FieldbyName('C14').AsString+''''+
                     ','''+QryDet.FieldbyName('C15').AsString+''''+
                     ','''+QryDet.FieldbyName('C16').AsString+''''+
                     ','''+QryDet.FieldbyName('C17').AsString+''''+
                     ','''+QryDet.FieldbyName('C18').AsString+''''+
                     ','''+QryDet.FieldbyName('C19').AsString+''''+
                     ','''+QryDet.FieldbyName('C20').AsString+''''+
                     ','''+QryDet.FieldbyName('C21').AsString+''''+
                     ','''+QryDet.FieldbyName('C22').AsString+''''+
                     ','''+QryDet.FieldbyName('C23').AsString+''''+
                     ','''+QryDet.FieldbyName('C24').AsString+''''+
                     ','''+QryDet.FieldbyName('C25').AsString+''''+
                     ','''+QryDet.FieldbyName('C26').AsString+''''+
                     ','''+QryDet.FieldbyName('C27').AsString+''''+
                     ','''+QryDet.FieldbyName('C28').AsString+''''+
                     ','''+QryDet.FieldbyName('C29').AsString+''''+
                     ','''+QryDet.FieldbyName('C30').AsString+''''+
                     ','''+QryDet.FieldbyName('C31').AsString+''''+
                     ','''+QryDet.FieldbyName('C32').AsString+''''+
                     ','''+QryDet.FieldbyName('C33').AsString+''''+
                     ','''+QryDet.FieldbyName('C34').AsString+''''+
                     ','''+QryDet.FieldbyName('C35').AsString+''''+
                     ','''+QryDet.FieldbyName('C36').AsString+''''+
                     ','''+QryDet.FieldbyName('C37').AsString+''''+
                     ','''+QryDet.FieldbyName('C38').AsString+''''+
                     ','''+QryDet.FieldbyName('C39').AsString+''''+
                     ','''+QryDet.FieldbyName('C40').AsString+''''+
                     ','''+QryDet.FieldbyName('C41').AsString+''''+
                     ','''+QryDet.FieldbyName('C42').AsString+''''+
                     ','''+QryDet.FieldbyName('C43').AsString+''''+
                     ','''+QryDet.FieldbyName('C44').AsString+''''+
                     ','''+QryDet.FieldbyName('C45').AsString+''''+
                     ','''+QryDet.FieldbyName('C46').AsString+''''+
                     ','''+QryDet.FieldbyName('C47').AsString+''''+
                     ','''+QryDet.FieldbyName('C48').AsString+''''+
                     ','''+QryDet.FieldbyName('C49').AsString+''''+
                     ','''+QryDet.FieldbyName('C50').AsString+''''+
                     ','''+QryDet.FieldbyName('C51').AsString+''''+
                     ','''+QryDet.FieldbyName('C52').AsString+''''+
                     ','''+QryDet.FieldbyName('C53').AsString+''''+
                     ','''+QryDet.FieldbyName('C54').AsString+''''+
                     ','''+QryDet.FieldbyName('C55').AsString+''''+
                     ','''+QryDet.FieldbyName('C56').AsString+''''+
                     ','''+QryDet.FieldbyName('C57').AsString+''''+
                     ','''+QryDet.FieldbyName('C58').AsString+''''+
                     ','''+QryDet.FieldbyName('C59').AsString+''''+
                     ','''+QryDet.FieldbyName('C60').AsString+''''+
                     ','''+QryDet.FieldbyName('C61').AsString+''''+
                     ','''+QryDet.FieldbyName('C62').AsString+''''+
                     ','''+QryDet.FieldbyName('C63').AsString+''''+
                     ','''+QryDet.FieldbyName('C64').AsString+''''+
                     ','''+QryDet.FieldbyName('C65').AsString+''''+
                     ','''+QryDet.FieldbyName('C66').AsString+''''+
                     ','''+QryDet.FieldbyName('C67').AsString+''''+
                     ','''+QryDet.FieldbyName('C68').AsString+''''+
                     ','''+QryDet.FieldbyName('C69').AsString+''''+
                     ','''+QryDet.FieldbyName('C70').AsString+''''+
                     ','''+QryDet.FieldbyName('C71').AsString+''''+
                     ','''+QryDet.FieldbyName('C72').AsString+''''+
                     ','''+QryDet.FieldbyName('C73').AsString+''''+
                     ','''+QryDet.FieldbyName('C74').AsString+''''+
                     ','''+QryDet.FieldbyName('C75').AsString+''''+
                     ','''+QryDet.FieldbyName('C76').AsString+''''+
                     ','''+QryDet.FieldbyName('C77').AsString+''''+
                     ','''+QryDet.FieldbyName('C78').AsString+''''+
                     ','''+QryDet.FieldbyName('C79').AsString+''''+
                     ','''+QryDet.FieldbyName('C80').AsString+''''+
                     ','''+QryDet.FieldbyName('C81').AsString+''''+
                     ','''+QryDet.FieldbyName('C82').AsString+''''+
                     ','''+QryDet.FieldbyName('C83').AsString+''''+
                     ','''+QryDet.FieldbyName('C84').AsString+''''+
                     ','''+QryDet.FieldbyName('C85').AsString+''''+
                     ','''+QryDet.FieldbyName('C86').AsString+''''+
                     ','''+QryDet.FieldbyName('C87').AsString+''''+
                     ','''+QryDet.FieldbyName('C88').AsString+''''+
                     ','''+QryDet.FieldbyName('C89').AsString+''''+
                     ','''+QryDet.FieldbyName('C90').AsString+''''+
                     ','''+QryDet.FieldbyName('C91').AsString+''''+
                     ','''+QryDet.FieldbyName('C92').AsString+''''+
                     ','''+QryDet.FieldbyName('C93').AsString+''''+
                     ','''+QryDet.FieldbyName('C94').AsString+''''+
                     ','''+QryDet.FieldbyName('C95').AsString+''''+
                     ','''+QryDet.FieldbyName('C96').AsString+''''+
                     ','''+QryDet.FieldbyName('C97').AsString+''''+
                     ','''+QryDet.FieldbyName('C98').AsString+''''+
                     ','''+QryDet.FieldbyName('C99').AsString+''''+
                     ','''+QryDet.FieldbyName('C100').AsString+''')';
             Sql.Add(vSql);
             ExecSql;
             frmAguarde.Pos := frmAguarde.Pos + 1;
             frmAguarde.Refresh;
             QryDet.Next;
       end;
  end;
  qryDet.EnableControls;
  frmAguarde.Apaga;
  SbtnCopiar.Down := False;
end;

procedure TfrmCadTabelaLonga.BitBtnExportarClick(Sender: TObject);
var
  Aux : TStringList;
  vLin : String;
  i, Total, wAcerto : LongInt;
begin
  inherited;

  Sd.FileName := dedNome.Text+'.txt';
  SD.Execute;

  QryDet.DisableControls;


  frmAguarde.Mostra('Verificando dados ...');
  frmAguarde.Refresh;
  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := QryDet.RecordCount;
  frmAguarde.Refresh;

  frmAguarde.Mostra('Selecionando dados ...');
  frmAguarde.Refresh;

  Aux := TStringList.Create;
  Total := dbgrdDet.FieldCount;
  QryDet.First;

  vLin := '';
  for i := 2 to 101 do begin
      if QryDet.fields[i].visible then begin
          wAcerto := 20 - Length(QryDet.fields[i].DisplayLabel);
          vLin := vLin + Trim(QryDet.fields[i].DisplayLabel)+' '+
                  Replicate(' ',wAcerto);
      end;
  end;
  Aux.Add(vLin);

  While not QryDet.Eof do begin
    vLin := '';
    for i := 0 to Total - 1 do begin
      try
        if dbgrdDet.Fields[i].AsString <> '' then begin
          wAcerto := 20 - Length(dbgrdDet.Fields[i].AsString);
          vLin := vLin + Trim(dbgrdDet.Fields[i].AsString)+' '+
                  Replicate(' ',wAcerto);
        end;
      except
          Raise;
      end;
    end;
    Aux.Add(vLin);
    QryDet.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
  end;
  QryDet.First;

  frmAguarde.Mostra('Salvando Arquivo '+Sd.FileName+' ...');
  frmAguarde.Refresh;


  Aux.SaveToFile(Sd.FileName);
  FreeAndNil(Aux);
  frmAguarde.Apaga;

  QryDet.EnableControls;
end;

procedure TfrmCadTabelaLonga.sbtnApagarClick(Sender: TObject);
begin

     if (MsgDlg('Deseja excluir tabela ?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then begin
        frmAguarde.Mostra('Excluindo dados ...');
        frmAguarde.Refresh;

        frmAguarde.Pos := 0;
        frmAguarde.Max := 3;
        frmAguarde.Min := 0;

        StartTransacao;
        with QryCopia do begin
             Close;
             Sql.Clear;
             Sql.Add('DELETE FROM LONGCMPTABGENER WHERE IDTABELA = '+InttoStr(vId));;
             try
                ExecSql;
             except
                frmAguarde.Apaga;
                RollBackTransacao;
                MsgDlg('Campos da Tabela não foram excluidos !','Erro',mtError,[mbOK],0);
                sbtnApagar.Down := False;
                exit;
             end;
             frmAguarde.Pos := frmAguarde.Pos + 1;

             Close;
             Sql.Clear;
             Sql.Add('DELETE FROM LONGVALTABGENER WHERE IDTABELA = '+InttoStr(vId));;
             try
                ExecSql;
             except
                frmAguarde.Apaga;
                RollBackTransacao;
                MsgDlg('Detalhes da Tabela não foram excluidos !','Erro',mtError,[mbOK],0);
                sbtnApagar.Down := False;
                exit;
             end;
             frmAguarde.Pos := frmAguarde.Pos + 1;

             Close;
             Sql.Clear;
             Sql.Add('DELETE FROM LONGTABGENER WHERE IDTABELA = '+InttoStr(vId));;
             try
                ExecSql;
             except
                frmAguarde.Apaga;
                RollBackTransacao;
                MsgDlg('Tabela não foi excluida !','Erro',mtError,[mbOK],0);
                sbtnApagar.Down := False;
                exit;
             end;
             frmAguarde.Pos := frmAguarde.Pos + 1;
        end;
        CommitTransacao;
     end;

     frmAguarde.Apaga;
     sbtnApagar.Down := False;
     Sel(vId);
end;

procedure TfrmCadTabelaLonga.bbtnOkDetClick(Sender: TObject);
begin
  AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
  AplicaAlteracoes([TDBDataSet(dsCmp.DataSet)]);
  AplicaAlteracoes([TDBDataSet(dsDet.DataSet)]);
  Qry.Edit;
  inherited;
  bbtnCancelarDet.Click;
  sbtnInsDet.Click;
end;

procedure TfrmCadTabelaLonga.dbgrdDetKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Ord(Key) = 32 then  //Barra de Espaço
     dbgrdDetDblClick(Sender);
end;

procedure TfrmCadTabelaLonga.QryDetBeforePost(DataSet: TDataSet);
begin
  FazQuery(QryAux,'SELECT MAX(NUMLINHA) AS PROXREG FROM LONGVALTABGENER WHERE IDTABELA = '+
                  qry.FieldByName('IDTABELA').AsString);

  If StrToInt(sProxReg) < (QryAux.FieldByName('PROXREG').AsInteger+1) Then Begin
    sProxReg := IntToStr(QryAux.FieldByName('PROXREG').AsInteger+1);
  End Else Begin
    sProxReg := IntToStr(StrToInt(sProxReg)+1);
  End;

  QryDet.FieldByName('IDTABELA').AsString := qry.FieldByName('IDTABELA').AsString;
  QryDet.FieldByName('NUMLINHA').AsString := sProxReg;

  inherited;

end;

end.



{

         I Love it Loud
                         KISS

 Stand up, you don't have to be afraid,
 get down - love is like a hurricane
 Street boy, no I never could be tamed,
 better believe it

 Guilty 'til I'm proven innocent,
 whiplash, heavy metal accident
 Rock on, I wanna be President,
 'cos

 Chorus:
 I love it loud, I wanna hear it loud, right between the eyes
 Loud, I wanna hear it loud, I don't want to compromise

 Turn it up, hungry for the medicine,
 two fisted to the very end
 No more treated like aliens,
 we're not gonna take it

 No lies, no more alibis,
 turn it up, it's got me hypnotized
 Rock on, I won't be tranquilized,

 'cos

 chorus repeats 2x

 Headlines jungle is the only rule,
 front page roar of the nation cool
 Turn it up, this is my attitude,

 take it or leave it

 chorus repeats out [both lines 'I love it loud, ...']

}
