//***************************************************************************************************
// Autor(a)    : Darivaldo Alencar
// Pendência   : SIG69309
// Data        : 11/06/2018
// Descricao   : Criação deste fonte  
//***************************************************************************************************
unit uGridProgresso;

interface

uses
  Classes, SysUtils,  Controls, fAguarde,
  DBCtrls, Db, DBClient, uCMClientDataSet;

const iVlrIncBarra = 2000;
type
  TGridProgresso = class(TThread)
  private
    iFuncionalidade: Integer;
    CdsDadosRetornoCaixa: TCMClientDataSet;
  protected
    procedure Execute; override;
    procedure SelecionaTudo;
    procedure DesSelecionaTudo;
  public
    constructor Create (const CreateSuspended : boolean; cds: TCMClientDataSet; iFunc: Integer);
  end;

implementation

{ Important: Methods and properties of objects in VCL can only be used in a
  method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TGridProgresso.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TGridProgresso }

constructor TGridProgresso.Create(const CreateSuspended: boolean;
  cds: TCMClientDataSet; iFunc: Integer);
begin
   Self.FreeOnTerminate      := true;
   self.CdsDadosRetornoCaixa := cds;
   self.iFuncionalidade      := iFunc;  
   inherited Create(CreateSuspended);
end;

procedure TGridProgresso.Execute;
begin
  case iFuncionalidade of
    1: self.Synchronize(SelecionaTudo);
    2: self.Synchronize(DesSelecionaTudo);
  end;
end;

procedure TGridProgresso.SelecionaTudo;
var
  iCountRegSelecionado: Integer;
begin
  if self.CdsDadosRetornoCaixa.active  then
   begin
      self.CdsDadosRetornoCaixa.DisableControls;
      self.CdsDadosRetornoCaixa.first;

      frmAguarde.Pos      := 1;
      frmAguarde.Max      := self.CdsDadosRetornoCaixa.RecordCount;
      iCountRegSelecionado:= 0;

      while not(self.CdsDadosRetornoCaixa.eof) do
      begin
        if (self.CdsDadosRetornoCaixa.FieldByName('SELECIONAR').AsInteger = 0) then
          begin
            self.CdsDadosRetornoCaixa.Edit;
            self.CdsDadosRetornoCaixa.FieldByName('SELECIONAR').Asstring := '1';
          end;

        iCountRegSelecionado := iCountRegSelecionado + 1;

        if (iCountRegSelecionado mod iVlrIncBarra = 0 )or
           (frmAguarde.Max = iVlrIncBarra) or
           (frmAguarde.Max = frmAguarde.Pos) or
           (frmAguarde.Pos <= 1) then
        begin
          frmAguarde.Mostra('Marcando : ' + IntToStr(iCountRegSelecionado) + ' de ' + IntToStr(self.CdsDadosRetornoCaixa.RecordCount) + '.');
          frmAguarde.Pos := iCountRegSelecionado;
        end;
        if (self.CdsDadosRetornoCaixa.state = dsEdit) then
            self.CdsDadosRetornoCaixa.post;
        self.CdsDadosRetornoCaixa.next;
      end;
      frmAguarde.Apaga;
      self.CdsDadosRetornoCaixa.first;
      self.CdsDadosRetornoCaixa.EnableControls;
   end;
end;

procedure TGridProgresso.DesSelecionaTudo;
var
  iCountRegSelecionado: Integer;
begin
 if self.CdsDadosRetornoCaixa.active  then
   begin
      self.CdsDadosRetornoCaixa.DisableControls;
      self.CdsDadosRetornoCaixa.first;
      iCountRegSelecionado:= 0;
      frmAguarde.Pos      := 1;
      frmAguarde.Max      := self.CdsDadosRetornoCaixa.RecordCount;
      while not(self.CdsDadosRetornoCaixa.eof) do
      begin
        if (self.CdsDadosRetornoCaixa.FieldByName('SELECIONAR').AsInteger = 1) then
          begin
           self.CdsDadosRetornoCaixa.Edit;
           self.CdsDadosRetornoCaixa.FieldByName('SELECIONAR').Asstring := '0';
          end;
        iCountRegSelecionado := iCountRegSelecionado + 1;

        if (iCountRegSelecionado mod iVlrIncBarra = 0 )or
           (frmAguarde.Max = iVlrIncBarra) or
           (frmAguarde.Max = frmAguarde.Pos) or
           (frmAguarde.Pos <= 1) then
          begin
            frmAguarde.Mostra('Desmarcando : ' + IntToStr(iCountRegSelecionado)+' de ' + IntToStr(self.CdsDadosRetornoCaixa.RecordCount) + '.');
            frmAguarde.Pos := iCountRegSelecionado;
          end;
        if (self.CdsDadosRetornoCaixa.state = dsEdit) then
            self.CdsDadosRetornoCaixa.post;
        self.CdsDadosRetornoCaixa.next;
      end;
      frmAguarde.Apaga;
      self.CdsDadosRetornoCaixa.first;
      self.CdsDadosRetornoCaixa.EnableControls;
   end;
end;


end.
