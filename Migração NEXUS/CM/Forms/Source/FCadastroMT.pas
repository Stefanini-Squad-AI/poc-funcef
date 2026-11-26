{-------------------------------------------------------------------------------------------------
Nº SOL......: 245968
Nº PPM......: 635851
Data........: 10/03/2015
Responsavel.: Wylliam Leite da Silva
Descrição...: Coreções no cadastro de cursos(Correção na frase da caixa de dialogo)
Rotinas.....: .pas
--------------------------------------------------------------------------------------------------}
unit FCadastroMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroPai, CmEventosCadastro, ImgList, Db, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, DBClient, uCMClientDataSet, Provider, MontaSelect, uCMTypes,
  Gauges, ComCtrls, fcLabel;

type
  TFrmCadastroMT = class(TfrmCadastroPai)
    Cds: TCMClientDataSet;
    MontaSelect: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    function TemAlteracaoPendente: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroMT: TFrmCadastroMT;

implementation

Uses uMensErro, uAutorizacao, uMidasUtil;

{$R *.DFM}

procedure TFrmCadastroMT.FormCreate(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled := false;
   CmeCadastro.RepetirInsert   := False;

   if cds.IsEmpty then
      CmeCadastro.Operacao := opVazio
   else
      CmeCadastro.Operacao := opIdle; 
end;

procedure TFrmCadastroMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   // Rodolpho da Silva - 23/01/2007
   if (CmeCadastro.Operacao = opInserir) then
   begin
      sbtnInserir.Down := true;
      Exit;
   end;

   if not (CmeCadastro.Operacao in [opIdle, opVazio]) then
      CmeCadastro.Cancel(self);

   CmeCadastro.Operacao := opInserir;
   CmeCadastro.RepetirInsert := True;
   CmeCadastro.AtualizaBotoes(Self);
   CmeCadastro.Insert(Self);
   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmCadastroMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   // Rodolpho da Silva - 23/01/2007
   // Não se pode verificar esta condição pelo Cds.State, pois
   //há muitas modificações e isso não é garantido.
   if (CmeCadastro.Operacao = opAlterar) then
   begin
      sbtnAlterar.Down := true;
      Exit;
   end;

   if not (CmeCadastro.Operacao in [opIdle, opVazio]) then
      CmeCadastro.Cancel(self);

   CmeCadastro.Operacao := opAlterar;
   CmeCadastro.RepetirInsert := False;
   CmeCadastro.AtualizaBotoes(Self);
   CmeCadastro.Edit(Self);
   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmCadastroMT.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   CmeCadastro.Operacao := opProcurar;
   MontaSelect.Executar;

   CmeCadastro.Find(Self);

   if cds.IsEmpty then
      CmeCadastro.Operacao := opVazio
   else
      CmeCadastro.Operacao := opIdle;

   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmCadastroMT.sbtnApagarClick(Sender: TObject);
begin
  inherited;
   if CmeCadastro.Operacao = opIdle then
   begin
        Try
          CmeCadastro.Operacao := opApagar;

          // Wylliam Leite - SOL:245968 PPM:635851
          if (MsgDlg('Deseja realmente excluir esse registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
              CmeCadastro.Delete(Self);

          if cds.IsEmpty then
             CmeCadastro.Operacao := opVazio
          else
              CmeCadastro.Operacao := opIdle;

          CmeCadastro.AtualizaBotoes(Self);
        Except
          CmeCadastro.Operacao := opIdle;
          sbtnApagar.Down := False;
          {
          cds.DisableControls;
          cds.Close;
          cds.Open;
          cds.EnableControls;
          }
          Raise;
        End;
   end;
end;

procedure TFrmCadastroMT.bbtnConfirmarClick(Sender: TObject);
var
  bInsert : boolean;
begin
  inherited;
  bInsert := CmeCadastro.RepetirInsert and (CmeCadastro.Operacao = opInserir);

  CmeCadastro.Confirma(Self);

  If CmeCadastro.ConfirmaCadastro Then
  Begin
      // Alex 18/04/05 Este método foi reimplementado pelo Gustavão
      // o escopo dele passa a ser private a Classe
      // CmeCadastro.DoAfterConfirma;

      if cds.IsEmpty then
         CmeCadastro.Operacao := opVazio
      else
          CmeCadastro.Operacao := opIdle;

      if bInsert then
         sbtnInserir.Click
      else
         CmeCadastro.AtualizaBotoes(Self);

      //If CmeCadastro.RepetirInsert Then sbtnInserir.Click;
  End;
end;

procedure TFrmCadastroMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  CmeCadastro.RepetirInsert := False;
  if cds.Active then
     CmeCadastro.Cancel(self);
  if cds.IsEmpty then
     CmeCadastro.Operacao := opVazio
  else
      CmeCadastro.Operacao := opIdle;

  CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmCadastroMT.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if ds.State in ([dsInsert, dsEdit]) then
    begin
    if TemAlteracaoPendente then
       if MsgDlg( 'Alguns dados informados ainda não foram gravados.'+#13+#10+'Deseja realmente sair da tela?',
                  'Alterações pendentes', mtWarning, [mbYes, mbNo],0) = mrNo then
          CanClose := false;
    end;

  if CanClose then bbtnCancelar.Click;

  If cds.ChangeCount > 0 Then cds.CancelUpdates;  
end;

function TFrmCadastroMT.TemAlteracaoPendente:Boolean ;
var
   i:integer;
begin
   Result := false;
   i := 0;
   while (i < ComponentCount) and (not Result) do begin
         if (Components[i] Is TCmClientDataSet) and
            (TCmClientDataSet(Components[i]).Active) and
            (TCmClientDataSet(Components[i]).ChangeCount > 0) then
            Result := true;
         Inc(i);
   end;
end;


procedure TFrmCadastroMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  If cds.State In [DsEdit,DsInsert] Then cds.Cancel;
end;

procedure TFrmCadastroMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  If cds.State In [DsEdit,DsInsert] Then cds.Post;
end;

procedure TFrmCadastroMT.CmeCadastroInsert(Sender: TObject);
begin
  If Cds.ChangeCount > 0 Then Cds.CancelUpdates;
  inherited;

  //David - 15/03/07 -> Incluído para resolver problema de dados permanentes antes de uma inclusão
  cds.EmptyDataSet;

  cds.Insert;
end;

procedure TFrmCadastroMT.CmeCadastroEdit(Sender: TObject);
begin
  If Cds.ChangeCount > 0 Then Cds.CancelUpdates;
  inherited;
  cds.Edit;
end;

procedure TFrmCadastroMT.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  cds.Delete;
  CmeCadastro.Confirma(Self);
end;

procedure TFrmCadastroMT.CmeCadastroAtualizaBotoes(Sender: TObject);
var
   ConfirmaVisible : Boolean;
begin
   inherited;
   { Configura o estado dos botões }

   sbtnInserir.Enabled := false;
   sbtnAlterar.Enabled := false;
   sbtnApagar.Enabled := false;
   sbtnProcurar.Enabled := false;
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
               sbtnProcurar.Enabled := true;

               if (cds.Active) and (not cds.IsEmpty) then
               begin
                  sbtnAlterar.Enabled := true;
                  sbtnApagar.Enabled := true;
               end
               else begin
                    sbtnAlterar.Enabled := false;
                    sbtnApagar.Enabled := false;
               end;
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
   else
       ConfirmaVisible := false;
   end;

   bbtnConfirmar.Enabled := ConfirmaVisible;
   bbtnCancelar.Enabled := ConfirmaVisible;

   if pnlfundo.Visible then
      pnlfundo.enabled := ConfirmaVisible;

   AutorizarForm(afSoDesabilitar);
end;

procedure TFrmCadastroMT.FormShow(Sender: TObject);
begin
  inherited;
  CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmCadastroMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  {
  RefreshCds([Cds]);
  }
end;

end.
