// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Gleyber
//  Rotina     : FormCreate e FormClose
//  Data       : 19/05/2006
//  Pendencia  : -----
//  Alteração  : Implementação para criar o datamodule DtmRelatBeneficios e
//               destrui-lo quando fechar o form.
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 04.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit FParamRelBenefAdiantPgtoIntegral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, wwdblook, CheckLst, Db, DBTables,
  Wwquery, Wwdatsrc;

type
  TFrmParamRelBenefPgtoIntegral = class(TfrmOkCancelar)
    GroupBox3: TGroupBox;
    dblookupPatrocinadora: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    lblMes: TLabel;
    lblAnoMes: TLabel;
    cboxMes: TComboBox;
    seAno: TSpinEdit;
    GroupBox2: TGroupBox;
    dblookupPlano: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    chklstBenef: TCheckListBox;
    bbtnTodas: TBitBtn;
    bbtnInverte: TBitBtn;
    dsPatro: TwwDataSource;
    qryPatro: TwwQuery;
    dsPlano: TwwDataSource;
    qryPlano: TwwQuery;
    dsBenef: TwwDataSource;
    qryBenef: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblookupPlanoChange(Sender: TObject);
    procedure dblookupPatrocinadoraChange(Sender: TObject);
    procedure bbtnTodasClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  MesAno  : String;
  public
    { Public declarations }
  end;

var
  FrmParamRelBenefPgtoIntegral: TFrmParamRelBenefPgtoIntegral;
  Lstbenef :TStringList;

implementation

uses uDataBase, uSistema, uMensErro, uSincronismo, DRelatBeneficios,
  UAdmPrev;

{$R *.DFM}

Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
                           Lista: TStringList; Chave, Descricao:String);
begin
  Lista.Clear;
  ChkList.Clear;
  while Not Query.Eof Do Begin
    ChkList.Items.Add(Query.FieldByName(Descricao).AsString);
    Lista.Add(Query.FieldByName(Chave).AsString);
    Query.Next;
  end;
end;  

procedure TFrmParamRelBenefPgtoIntegral.bbtnConfirmarClick(Sender: TObject);
Var
  I : Integer ;
  Mes, StrBenef: String;
begin
  inherited;

  //Inicializando as variáveis;
   StrBenef := '';   
 
  //Critica dados
  If (cboxMes.Text = '')  Then Begin
    ShowMessage('Faltam Preencher Campos ...');
    cboxMes.SetFocus;
    ModalResult := mrNone;
    Exit;
  End;

  // Transforma data em AnoMes
  if (cboxMes.ItemIndex + 1) < 9 then
    Mes := '0'+IntToStr((cboxMes.ItemIndex + 1))
  else
    Mes := IntToStr((cboxMes.ItemIndex + 1));

  MesAno :=  IntToStr(seAno.Value) + '/' + Mes ;

  dtmRelatBeneficios.pplMesReferenciaPgtoInt.Caption := MesAno ;

  // Gera Linha com os Benefícios
  For I := 0 to chklstBenef.Items.Count -1 do Begin
    If chklstBenef.Checked[I] = True Then begin
      StrBenef := StrBenef + Lstbenef.Strings[I] +  ',';
    end;
  end;

  StrBenef := Trim(Copy(StrBenef,1,((Length(StrBenef)-1))));

   With dtmRelatBeneficios.qryBenefAdiantPgtoIntegral Do
      begin
        close;
        SQL.clear;
        SQL.add(' SELECT  '+
                ' BENEF.NOME AS BENEFICIARIO, PATR.NOME AS PATROCINADORA,PL.NOME AS NOMEPLANO, ' +
                ' D.MATRICULA, BE.DATAINICIOFUND, BE.DATACONCESSAO, B.NOME AS NOMEBENEF,' +
                ' BE.PERCPROVISORIO, BE.DATAFINALPREVISTA, BE.VALORTOTAL, BE.VALORATUAL ' +
                ' FROM  PESSOA BENEF, PESSOA PATR, PATRO ,  ' +
                '       DEPENTIT D, BENEFICIO B, PLANPREV PL, BENEFBFCIARIO BE '+
                ' WHERE '+

                //* parâmetro da tela MESREFERENCIA*
                ' (TO_CHAR(BE.DATACONCESSAO,''YYYY/MM'') = '+ QuotedStr(MesAno) + ')' +

                //* Patrocinadora *
                ' AND (PATRO.IDPESSOA = ' +qryPatro.FieldByName('IDPESSOA').AsString+ ')'+

                //* Plano * 
                ' AND (PL.IDPLANOPREV = ' +qryPlano.FieldByName('IDPLANOPREV').AsString+ ')');

                //* Benefícios *
                  If StrBenef <> '' Then
                     SQL.add(' AND B.IDBENEFICIO IN ('+StrBenef+')  ');

                SQL.add('AND BE.FlgProvisorio = 0 ');
                SQL.add('AND BE.PercProvisorio > 0 ');
                SQL.add('AND PATRO.IDPESSOA =  PATR.IDPESSOA  ');
                SQL.add('AND PATRO.IDPESSOA  = BE.IDPESSJUR ');
                SQL.add('AND BENEF.IDPESSOA  = D.IDPESSOA  ');
                SQL.add('AND D.IDPESSOA   = BE.IDPESSOA  ');
                SQL.add('AND B.IDBENEFICIO   = BE.IDBENEFICIO ');
                SQL.add('AND PL.IDPLANOPREV = BE.IDPLANOPREV   ');

                SQL.add('GROUP BY  BENEF.NOME , PATR.NOME , PL.NOME,');
                SQL.add('D.MATRICULA, BE.DATAINICIOFUND, BE.DATACONCESSAO,');
                SQL.add('B.NOME,BE.PERCPROVISORIO, BE.DATAFINALPREVISTA, ');
                SQL.add('BE.VALORTOTAL, BE.VALORATUAL');

        Open;
        end;

end;

procedure TFrmParamRelBenefPgtoIntegral.FormShow(Sender: TObject);
begin
  inherited;
  //cria Lista de benefícios
  Lstbenef     := TStringList.Create;

  cboxMes.Text := 'Janeiro';

  with qryPatro do //Selecionando automaticamente a Primeira Patrocinadora da Lista;
  begin
    Close;
    ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
    Open;
    if RecordCount > 0 then
     dblookupPatrocinadora.Text := FieldByName('NOME').AsString;
  end;

  //Filtra Plano por Patrocinadora Indicada
  with  qryPlano do
  begin
    close;
    ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
    open;
    if RecordCount > 0 then
     dblookupPlano.Text := FieldByName('NOME').AsString;
  end;

  with  qryBenef do
  begin
    close;
    ParamByName('IDPLANOPREV').AsInteger := qryPlano.FieldByName('IDPLANOPREV').AsInteger;
    open;
  end;

  CriaLista(chklstBenef,qryBenef,LstBenef,'IDBENEFICIO','NOME');
end;

procedure TFrmParamRelBenefPgtoIntegral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dtmRelatBeneficios.Free; 

  //Fechando as Queries;

  qryPlano.Close;
  qryPatro.Close;
  qryBenef.Close;

 //Libera Lista
  LstBenef.Free;   
end;

procedure TFrmParamRelBenefPgtoIntegral.dblookupPlanoChange(Sender: TObject);
begin
  inherited;
  //Filtra Benefício  por Plano Indicado
  with  qryBenef do
  begin
    close;
    ParamByName('IDPLANOPREV').AsInteger := qryPlano.FieldByName('IDPLANOPREV').AsInteger;
    open;
  end;
  
  CriaLista(chklstBenef,qryBenef,LstBenef,'IDBENEFICIO','NOME');
end;

procedure TFrmParamRelBenefPgtoIntegral.dblookupPatrocinadoraChange(Sender: TObject);
begin
  inherited;
   with  qryPlano do
  begin
    close;
    ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
    open;
    if RecordCount > 0 then
     dblookupPlano.Text := FieldByName('NOME').AsString;
  end;

  with  qryBenef do
  begin
    close;
    ParamByName('IDPLANOPREV').AsInteger := qryPlano.FieldByName('IDPLANOPREV').AsInteger;
    open;
  end;

  CriaLista(chklstBenef,qryBenef,LstBenef,'IDBENEFICIO','NOME');
end;

procedure TFrmParamRelBenefPgtoIntegral.bbtnTodasClick(Sender: TObject);
var
 i: Integer;
begin
  inherited;
  for I := 0 to chklstBenef.Items.Count - 1 do
    chklstBenef.checked[I]:= True;
end;

procedure TFrmParamRelBenefPgtoIntegral.bbtnInverteClick(Sender: TObject);
var
 i: Integer;
begin
  inherited;
  for I := 0 to chklstBenef.Items.Count - 1 do
    chklstBenef.Checked[I] := Not chklstBenef.Checked[I];
end;

procedure TFrmParamRelBenefPgtoIntegral.FormCreate(Sender: TObject);
begin
  inherited;

  try
    Application.CreateForm(TdtmRelatBeneficios, dtmRelatBeneficios);
  except
    MessageDlg(
      'Erro ao criar datamodule "TdtmRelatBeneficios".'+#13+#10+
      'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
  end;
end;



end.