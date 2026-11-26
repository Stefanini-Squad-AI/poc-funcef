// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Rotina      : FormShow, dblkpcmbBancoCloseUp, dblkpcmbBancoExit
//Pendência   : SIG100575
//Responsável : Edilaine
//Data        : 13/07/2020
//Descrição   : conta corrente nao estava respeitando mascara cadastrada para o banco
//-----------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 25/06/2003
// Alteração   : Validação da conta somente se FLGVALIDACC = 'S'
//------------------------------------------------------------------------------
unit FCadContaRequerimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, DBCtrls,
  Wwdatsrc, TEdNum, Mask, wwdbedit;

type
  TfrmCadContaRequerimento = class(TfrmOkCancelar)
    qryBanco: TwwQuery;
    qryAgenciaNome: TwwQuery;
    Label1: TLabel;
    edNOME: TEdit;
    grpAgencia: TGroupBox;
    Label38: TLabel;
    dblkpcmbAgenciaNome: TwwDBLookupCombo;
    qryAgenciaNumero: TwwQuery;
    Label2: TLabel;
    Label3: TLabel;
    
    Label4: TLabel;
    dblkpcmbBanco: TwwDBLookupCombo;
    Label40: TLabel;
    qryBancoNumero: TwwQuery;
    rgrpTipoConta: TRadioGroup;
    dbgrpContaPref: TRadioGroup;
    dbgrpContaConj: TRadioGroup;
    edDigBanco: TEditNum;
    edDigAgencia: TEditNum;
    updCBancaria: TUpdateSQL;
    qryCBancaria: TwwQuery;
    dsCBancaria: TDataSource;
    edContaCorrente: TwwDBEdit;
    procedure FormShow(Sender: TObject);
    procedure dblkpcmbBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edContaCorrenteExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkpcmbAgenciaNumeroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbAgenciaNomeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbBancoNumeroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edDigBancoExit(Sender: TObject);
    procedure edDigAgenciaExit(Sender: TObject);
    procedure dblkpcmbBancoExit(Sender: TObject);
  private
    { Private declarations }

    procedure ValidaConta;
  public
    { Public declarations }
  end;

var
  frmCadContaRequerimento: TfrmCadContaRequerimento;

implementation

uses UCalcDV, UMensErro,UDataBase;

{$R *.DFM}

procedure TfrmCadContaRequerimento.FormShow(Sender: TObject);
begin
  inherited;
  if not qryBanco.Active
  then begin

    qryBanco.Close;
    qryBanco.Open;

    qryAgenciaNome.Close;
    qryAgenciaNome.ParamByName('pIdBanco').AsInteger := qryBanco.FieldbyName('IdPessoa').AsInteger;
    qryAgenciaNome.Open;
    
    qryAgenciaNumero.Close;
    qryAgenciaNumero.ParamByName('pIdBanco').AsInteger := qryBanco.FieldbyName('IdPessoa').AsInteger;
    qryAgenciaNumero.Open;
  end;
  
  //edilaine SIG100575 : inicio
  if qryCBancaria.State = dsEdit then
     edContaCorrente.SetFocus
  else
     dblkpcmbBanco.SetFocus;
  //edilaine SIG100575 : fim

end;

procedure TfrmCadContaRequerimento.dblkpcmbBancoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not qryBanco.Active then Exit;
  qryAgenciaNome.Close;
  qryAgenciaNome.ParamByName('pIdBanco').AsInteger := qryBanco.FieldbyName('IdPessoa').AsInteger;
  qryAgenciaNome.Open;

  qryAgenciaNumero.Close;
  qryAgenciaNumero.ParamByName('pIdBanco').AsInteger := qryBanco.FieldbyName('IdPessoa').AsInteger;
  qryAgenciaNumero.Open;

  edDigBanco.Text :=  IntToStr(qryBanco.FieldbyName('NUMBANCO').AsInteger);

  edDigAgencia.Text := '';

  dblkpcmbBancoExit(Sender);    //edilaine SIG100575

end;

procedure TfrmCadContaRequerimento.edContaCorrenteExit(Sender: TObject);
begin
  inherited;
  //edilaine SIG100575 : inicio
  if (bbtnCancelar.Focused) or( bbtnSair.Focused) then
     exit;

  ValidaConta();
  //edilaine SIG100575 : fim
end;

procedure TfrmCadContaRequerimento.bbtnConfirmarClick(Sender: TObject);
begin

  if Trim(dblkpcmbBanco.Text) = ''
  then begin
     MsgDlg('Selecione o Banco da Conta Bancária. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if (Trim(dblkpcmbAgenciaNome.Text) = '') or (Trim(edDigAgencia.Text) = '')
  then begin
     MsgDlg('Selecione a Agência da Conta Bancária. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if Trim(edContaCorrente.Text) = ''
  then begin
     MsgDlg('Informe a Conta Corrente. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  inherited;

end;

procedure TfrmCadContaRequerimento.dblkpcmbAgenciaNumeroCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryAgenciaNome.Locate('IdPessoa',qryAgenciaNumero.FieldbyName('IdPessoa').AsInteger,[loCaseInsensitive]);
  dblkpcmbAgenciaNome.Text := qryAgenciaNumero.FieldByName('Agencia').AsString;
  dblkpcmbAgenciaNome.PerformSearch;
end;

procedure TfrmCadContaRequerimento.dblkpcmbAgenciaNomeCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryAgenciaNumero.Locate('IdPessoa',qryAgenciaNome.FieldbyName('IdPessoa').AsInteger,[loCaseInsensitive]);
  edDigAgencia.Text    := qryAgenciaNome.FieldByName('NumAgencia').AsString;  
end;

procedure TfrmCadContaRequerimento.dblkpcmbBancoNumeroCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Trim(edDigBanco.Text) = '' then Exit;
  if qryBanco.Locate('NumBanco',Trim(edDigBanco.Text),[loCaseInsensitive, loPartialKey])
  then begin
     dblkpcmbBanco.Text := qryBanco.FieldByName('Banco').AsString;
     dblkpcmbBanco.PerformSearch;
     dblkpcmbBanco.OnCloseUp(self,qryBanco,nil,false);        
  end;
end;

procedure TfrmCadContaRequerimento.edDigBancoExit(Sender: TObject);
begin
  inherited;

  if Trim(edDigBanco.Text) = '' then Exit;
  if qryBanco.Locate('NumBanco',Trim(edDigBanco.Text),[loCaseInsensitive, loPartialKey])
  then begin
     dblkpcmbBanco.Text := qryBanco.FieldByName('Banco').AsString;
     dblkpcmbBanco.PerformSearch;
     dblkpcmbBanco.OnCloseUp(self,qryBanco,nil,false);  
  end;
end;

procedure TfrmCadContaRequerimento.edDigAgenciaExit(Sender: TObject);
begin
  inherited;
  
  if Trim(edDigAgencia.Text) = '' then Exit;
  if qryAgenciaNome.Locate('NumAgencia',Trim(edDigAgencia.Text),[loCaseInsensitive, loPartialKey])
  then begin
     dblkpcmbAgenciaNome.Text := qryAgenciaNome.FieldByName('Agencia').AsString;
     dblkpcmbAgenciaNome.PerformSearch;
     dblkpcmbAgenciaNome.OnCloseUp(self,qryAgenciaNome,nil,false);
  end;

end;

//edilaine SIG100575 : inicio
procedure TfrmCadContaRequerimento.dblkpcmbBancoExit(Sender: TObject);
begin
  inherited;
  If (Not qryBanco.FieldByName('MASCARACC').IsNull) Then
     qryCBancaria.FieldByName('CONTACORRENTE').EditMask := qryBanco.FieldByName('MASCARACC').AsString + ';' + MaskNoSave + '; '
  Else
     qryCBancaria.FieldByName('CONTACORRENTE').EditMask := '';

  qryCBancaria.FieldByName('BANCO').AsString := qryBanco.FieldByName('BANCO').AsString;

  edContaCorrente.text := '';
end;

procedure TfrmCadContaRequerimento.ValidaConta;
begin
  If Trim(qryBanco.FieldByName('FLGVALIDACC').AsString) = 'S'
   Then
        CalculaDv := TCalcDv.Create;          //edilaine SIG100575
        try
           CalculaDV.TipoConta  := rgrpTipoConta.ItemIndex + 1;
           if not CalculaDV.ValidaConta( qryBanco.FieldByName('NumBanco').AsString,
                                         qryAgenciaNumero.FieldByName('Numagencia').AsString,
                                         edContaCorrente.Text,
                                         True)
           then begin
              edContaCorrente.Text := '';
              edContaCorrente.SetFocus;
           end;
        finally
           CalculaDv.Free;
        end;
end;
//edilaine SIG100575 : fim

end.
