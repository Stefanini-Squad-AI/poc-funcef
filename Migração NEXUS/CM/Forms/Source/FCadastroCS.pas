unit FCadastroCS;

{-------------------------------------------------------------------------------
-- criada função para verificar se existe transação aberta antes de iniciar outra
   quando efetua a rotina de apply updates
Alteracao........: bFlgValidaInTransaction
Nº SIG:........... 33979
Data da Alteração: 07/11/2017
Responsável......: Edilaine
Descrição........: Reestruturação da tela do elegível
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, DB, Buttons, StdCtrls, ExtCtrls, FTelaAut, MAHlpBtn, wwidlg,
  Wwdatsrc, DBTables, Wwtable, cmseldlg, FProcurar, wwQuery, ToolWin,
  ComCtrls, FOkCancelar, TB97, MontaSelect, TB97Tlbr, TB97Ctls, IvDictio,
  IvMulti, IvEMulti, fCadastroPai, ImgList, ActnList, CmEventosCadastro,
  UAutorizacao,       //edilaine - SIG33979
  Gauges, fcLabel;

type
  TfrmCadastroCS = class(TfrmCadastroPai)
    upd: TUpdateSQL;
    MontaSelect: TMontaSelect;
    qry: TwwQuery;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

  protected
    bFlgValidaInTransaction : Boolean;          //edilaine - SIG33979
    
  public
    function TemAlteracaoPendente:Boolean;
  end;

var
  frmCadastroCS: TfrmCadastroCS;

implementation

uses UMensErro, FSairAjuda, uDatabase, DBaseDados {$IFNDEF VER0505}, uCMTypes {$ENDIF};   //edilaine - SIG33979

{$R *.DFM}

procedure TfrmCadastroCS.FormCreate(Sender: TObject);
begin
   inherited;
   pnlFundo.Enabled := false;
   CmeCadastro.RepetirInsert   := False;

   bFlgValidaInTransaction := false;          //edilaine - SIG33979

   if qry.IsEmpty then
      CmeCadastro.Operacao := opVazio
   else
      CmeCadastro.Operacao := opIdle;   
end;

procedure TfrmCadastroCS.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if not (CmeCadastro.Operacao in [opIdle, opVazio]) then
      CmeCadastro.Cancel(self);

   CmeCadastro.Operacao := opInserir;
   CmeCadastro.RepetirInsert := True;
   CmeCadastro.AtualizaBotoes(Self);
   CmeCadastro.Insert(Self);
   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TfrmCadastroCS.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   if not (CmeCadastro.Operacao in [opIdle, opVazio]) then
      CmeCadastro.Cancel(self);

   CmeCadastro.Operacao := opAlterar;
   CmeCadastro.RepetirInsert := False;
   CmeCadastro.AtualizaBotoes(Self);
   CmeCadastro.Edit(Self);
   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TfrmCadastroCS.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   CmeCadastro.Operacao := opProcurar;
   MontaSelect.Executar;

   CmeCadastro.Find(Self);

   if qry.IsEmpty then
      CmeCadastro.Operacao := opVazio
   else
      CmeCadastro.Operacao := opIdle;
      
   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TfrmCadastroCS.sbtnApagarClick(Sender: TObject);
begin
   inherited;
   if CmeCadastro.Operacao = opIdle then
   begin
        Try
          CmeCadastro.Operacao := opApagar;

          if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
              CmeCadastro.Delete(Self);

          if qry.IsEmpty then
             CmeCadastro.Operacao := opVazio
          else
              CmeCadastro.Operacao := opIdle;

          CmeCadastro.AtualizaBotoes(Self);
        Except
          CmeCadastro.Operacao := opIdle;
          sbtnApagar.Down := False;
          Qry.DisableControls;
          Qry.Close;
          Qry.Open;
          Qry.EnableControls;
          Raise;
        End;
   end;
end;

procedure TfrmCadastroCS.bbtnConfirmarClick(Sender: TObject);
var
  bInsert : boolean;
begin
  inherited;
  bInsert := CmeCadastro.RepetirInsert and (CmeCadastro.Operacao = opInserir);

  CmeCadastro.Confirma(Self);

  If CmeCadastro.ConfirmaCadastro Then
  Begin
      if qry.IsEmpty then
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

procedure TfrmCadastroCS.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   CmeCadastro.RepetirInsert := False;
   if qry.Active then
      CmeCadastro.Cancel(self);
   if qry.IsEmpty then
      CmeCadastro.Operacao := opVazio
   else
       CmeCadastro.Operacao := opIdle;

   CmeCadastro.AtualizaBotoes(Self);
end;


procedure TfrmCadastroCS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ds.State in ([dsInsert, dsEdit]) then
     begin
     if TemAlteracaoPendente then
        if MsgDlg( 'Alguns dados informados ainda não foram gravados.'+#13+#10+'Deseja realmente sair da tela?',
                   'Alterações pendentes', mtWarning, [mbYes, mbNo],0) = mrNo then
           CanClose := false;
     end;
   if CanClose then bbtnCancelar.Click;
   inherited;
end;


function TfrmCadastroCS.TemAlteracaoPendente:Boolean ;
var
   i:integer;
begin
   Result := false;
   i := 0;
   while (i < ComponentCount) and (not Result) do begin
         if (TObject(Components[i]).ClassNameIs('TwwQuery')) and
            (TwwQuery(Components[i]).Active) and
            (TwwQuery(Components[i]).CachedUpdates) and
            (TwwQuery(Components[i]).UpdatesPending) then
            Result := true;
         Inc(i);
   end;
end;

procedure TfrmCadastroCS.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  qry.CancelUpdates;
end;

procedure TfrmCadastroCS.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  //edilaine - SIG33979 - inicio
  if bFlgValidaInTransaction then
     AplicaAlteracoesInTransacao([TDBDataSet(ds.DataSet)])
  else
     AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
  //edilaine - SIG33979 - fim
end;

procedure TfrmCadastroCS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.Insert;
end;

procedure TfrmCadastroCS.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  qry.Edit;
end;

procedure TfrmCadastroCS.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  qry.Delete;
  CmeCadastro.Confirma(Self);
end;

procedure TfrmCadastroCS.CmeCadastroAtualizaBotoes(Sender: TObject);
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

               if (qry.Active) and (not qry.IsEmpty) then
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

procedure TfrmCadastroCS.FormShow(Sender: TObject);
begin
  inherited;
  CmeCadastro.AtualizaBotoes(Self);
end;

end.

