unit FCadastro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, DB, Buttons, StdCtrls, ExtCtrls, FTelaAut, MAHlpBtn, wwidlg,
  Wwdatsrc, DBTables, Wwtable, FProcurar, wwQuery, ToolWin,
  ComCtrls, FOkCancelar, TB97, TB97Tlbr, TB97Ctls, IvDictio, IvMulti,
  IvEMulti, CmEventosCadastro, wwDialog, ImgList {$IFNDEF VER0505}, uCMTypes {$ENDIF},
  FCadastroPai, ActnList, cmseldlg, Gauges, fcLabel;

type
  TfrmCadastro = class(TfrmCadastroPai)
    srchdlgProcura: TwwSearchDialog;
    seldlgProcuraQry: TcmSelectDlg;
    dbnav: TDBNavigator;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroOpenDataSet(Sender: TObject);

  private
    { Private declarations }
    FFormProcurar: TCMProcurar;
    
  protected

  public
	{ Public declarations }
    FlagInsert : boolean;
    FazendoCloseOpen : Boolean;
    property FormProcurar : TCMProcurar read FFormProcurar write FFormProcurar;

  end;

var
  frmCadastro: TfrmCadastro;

implementation

uses UMensErro, FSairAjuda, uDatabase, uAutorizacao;

{$R *.DFM}


procedure TfrmCadastro.FormCreate(Sender: TObject);

begin
   inherited;
   CmeCadastro.OpenDataSet(Self);
   
   If Assigned(Ds.DataSet) And (Not Ds.DataSet.IsEmpty) Then
      CmeCadastro.Operacao := opIdle
   Else
      CmeCadastro.Operacao := opVazio;

   CmeCadastro.AtualizaBotoes(Self);

   LockWindowUpdate(Handle);
   FlagInsert := false; // serve para controle do Botões de Inserir e Alterar

   CmeCadastro.RepetirInsert := False;
   FazendoCloseOpen := False;

   if ds.DataSet is TwwTable then
      srchdlgProcura.SearchTable := TwwTable(ds.DataSet);

   if ds.DataSet is TwwQuery then
      seldlgProcuraQry.DataSet := TwwQuery(ds.DataSet);

   if ds.State <> dsInactive then
      if ds.DataSet.IsEmpty then
         CmeCadastro.Operacao := opVazio
      else
          CmeCadastro.Operacao := opIdle;
   { Verifica a autorização do usuário }
   CmeCadastro.AtualizaBotoes(Self);
   LockWindowUpdate(0);
   AutorizarForm(afSoDesabilitar);
end;

procedure TfrmCadastro.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if not (CmeCadastro.Operacao in [opIdle, opVazio]) then
      bbtnCancelarClick(Self);

   CmeCadastro.Operacao := opInserir;
   CmeCadastro.RepetirInsert := True;

   CmeCadastro.AtualizaBotoes(Self);
   CmeCadastro.Insert(self);
end;

procedure TfrmCadastro.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   if not (CmeCadastro.Operacao in [opIdle, opVazio]) then
      bbtnCancelarClick(Self);

   CmeCadastro.Operacao := opAlterar;
   CmeCadastro.RepetirInsert := False;
   CmeCadastro.AtualizaBotoes(Self);
   CmeCadastro.Edit(self);
end;

procedure TfrmCadastro.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   if not (CmeCadastro.Operacao in [opIdle, opVazio]) then
      bbtnCancelarClick(Self);

   CmeCadastro.Operacao :=  opProcurar;
   CmeCadastro.AtualizaBotoes(Self);
   CmeCadastro.Find(Self);

   if ds.DataSet.IsEmpty then
      CmeCadastro.Operacao := opVazio
   else
       CmeCadastro.Operacao := opIdle;

   sbtnProcurar.Down := false;
   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TfrmCadastro.sbtnApagarClick(Sender: TObject);
begin
   inherited;
   if CmeCadastro.Operacao = opIdle then
   begin
        CmeCadastro.Operacao := opApagar;
        CmeCadastro.AtualizaBotoes(Self);
        CmeCadastro.Delete(Self);

        if ds.DataSet.IsEmpty then
           CmeCadastro.Operacao := opVazio
        else
            CmeCadastro.Operacao := opIdle;
   end;
   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TfrmCadastro.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   CmeCadastro.Confirma(Self);

   If CmeCadastro.ConfirmaCadastro Then
   Begin
       if ds.DataSet.IsEmpty then
          CmeCadastro.Operacao := opVazio
       else
           CmeCadastro.Operacao := opIdle;

       CmeCadastro.AtualizaBotoes(Self);

       if CmeCadastro.RepetirInsert then sbtnInserirClick(Self);
   End;
end;

procedure TfrmCadastro.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if ds.DataSet.IsEmpty then
      CmeCadastro.Operacao := opVazio
   else
       CmeCadastro.Operacao := opIdle;

   CmeCadastro.RepetirInsert := False;
   CmeCadastro.Cancel(self);
   CmeCadastro.AtualizaBotoes(Self);
end;


procedure TfrmCadastro.sbtnInserirMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     inherited;
     CmeCadastro.RepetirInsert := True; //ssShift in Shift;
end;

procedure TfrmCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if ds.State <> dsInactive then
        bbtnCancelarClick(Self);
  inherited;
end;

procedure TfrmCadastro.CmeCadastroAtualizaBotoes(Sender: TObject);
var
   ConfirmaVisible : Boolean;
begin
   inherited;

   sbtnInserir.Enabled := false;
   sbtnAlterar.Enabled := false;
   sbtnApagar.Enabled := false;
   sbtnProcurar.Enabled := false;
   ConfirmaVisible := false;
   case CmeCadastro.Operacao of
   opVazio :
          begin
               sbtnInserir.Down := false;
               sbtnAlterar.Down := false;
               sbtnApagar.Down  := false;
               sbtnProcurar.Down := false;
               sbtnInserir.Enabled := true;
               sbtnAlterar.Enabled := false;
               sbtnApagar.Enabled := false;
               sbtnProcurar.Enabled := true;

               ConfirmaVisible := false;
          end;
   opIdle :
          begin
               sbtnInserir.Down := false;
               sbtnAlterar.Down := false;
               sbtnApagar.Down  := false;
               sbtnProcurar.Down := false;
               sbtnInserir.Enabled := true;
               sbtnAlterar.Enabled := true;
               sbtnApagar.Enabled := true;
               sbtnProcurar.Enabled := true;

               ConfirmaVisible := false;
          end;
   opInserir :
             begin
                  sbtnInserir.Down := true;
                  sbtnInserir.Enabled := true;
                  ConfirmaVisible := true;
             end;
   opAlterar :
          begin
               sbtnAlterar.Down := true;
               sbtnAlterar.Enabled := true;
               ConfirmaVisible := true;
          end;
   opProcurar :
               begin
                    sbtnProcurar.Down := true;
                    sbtnProcurar.Enabled := true;
                    ConfirmaVisible := false;
               end;
   opApagar :
            begin
                 sbtnApagar.Down  := false;
                 sbtnApagar.Enabled := true;
                 ConfirmaVisible := false;
            end;
   end;

   bbtnConfirmar.Visible := ConfirmaVisible;
   bbtnCancelar.Visible := ConfirmaVisible;
   dbNav.visible := not ConfirmaVisible;
   AutorizarForm(afSoDesabilitar);
   DrawFundo;
end;

procedure TfrmCadastro.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  ds.DataSet.Edit;
end;

procedure TfrmCadastro.CmeCadastroFind(Sender: TObject);
var
   bmrk: TBookmark;
begin
   if ds.DataSet is TwwTable then
      srchdlgProcura.SearchTable := TwwTable(ds.DataSet);

   if ds.DataSet is TwwQuery then
      seldlgProcuraQry.DataSet := TwwQuery(ds.DataSet);

   if ds.DataSet <> Nil
   then if FormProcurar <> Nil
        then FormProcurar.Procurar(ds.DataSet)
        else begin
           bmrk := ds.DataSet.GetBookmark;
           if ds.Dataset is TTable then begin
              if Not srchdlgProcura.Execute then ds.DataSet.GotoBookmark(bmrk);
           end else
              if Not seldlgProcuraQry.Execute then ds.DataSet.GotoBookmark(bmrk);
           ds.DataSet.FreeBookmark(bmrk);
        end;
end;

procedure TfrmCadastro.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  if ds.DataSet.IsEmpty then
     MsgDlg('Tabela está vazia','Erro',mtError,[mbOk, mbHelp], 0)
  else
     try
        { Pergunta se deseja realmente apagar }
        if MsgDlg('Deseja realmente apagar este registro?', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
        then ds.DataSet.Delete;
     except
        MsgDlg('Exclusão não efetuada','Erro',mtError,[mbOk, mbHelp], 0)
     end;

  sbtnApagar.Down := False;
end;

procedure TfrmCadastro.CmeCadastroConfirma(Sender: TObject);
var
   EstadoAntes: TDatasetState;
begin
   if ds.DataSet.State in [dsInsert, dsEdit] then
   begin
      EstadoAntes := ds.State;

      ds.DataSet.Post;

      if ds.DataSet is TwwQuery then
      begin
         if EstadoAntes = dsInsert then
         begin
            FazendoCloseOpen := True;
            CmeCadastro.CloseDataSet(Self);
            CmeCadastro.OpenDataSet(Self);
            FazendoCloseOpen := False;
         end;
      end;
   end;
end;


procedure TfrmCadastro.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  try
     RollBackTransacao;
     if (ds.DataSet <> nil) and (ds.dataset.state  in [dsInsert, dsEdit]) then
         ds.DataSet.Cancel;
  except

  end;
end;

procedure TfrmCadastro.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  ds.DataSet.Insert;
end;

procedure TfrmCadastro.CmeCadastroOpenDataSet(Sender: TObject);
begin
  inherited;
  If CmeCadastro.OpenDsAutomatico And Assigned(Ds.DataSet) Then
     Ds.DataSet.Open;
end;

end.

