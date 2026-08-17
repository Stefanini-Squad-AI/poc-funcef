unit FLancaOrcam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Mask, wwdbedit,
  Db, DBTables, Wwquery, TREdit, wwdblook, Spin, Wwtable, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, CMProcura, MontaSelect;

type
  TfrmLancaOrcam = class(TfrmOkCancelar)
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblBenef: TLabel;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    MontaSelect1: TMontaSelect;
    MontaSelect2: TMontaSelect;
    MontaSelect3: TMontaSelect;
    MontaSelect4: TMontaSelect;
    dblcNumero: TCMProcura;
    dblcSalario: TCMProcura;
    dblcEncargo: TCMProcura;
    dblcBenef: TCMProcura;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancaOrcam: TfrmLancaOrcam;

implementation

uses FOrcam, dBaseDados, uSistema, uFuncoesUteisRH;

{$R *.DFM}

procedure TfrmLancaOrcam.FormShow(Sender: TObject);
var
  wDia, wMes, wAno : word;
begin
  inherited;

  MontaSelect1.Filtro.Clear;
  MontaSelect2.Filtro.Clear;
  MontaSelect3.Filtro.Clear;
  MontaSelect4.Filtro.Clear;
  
  MontaSelect1.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' + sPlanoOrc);
  MontaSelect2.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' + sPlanoOrc);
  MontaSelect3.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' + sPlanoOrc);
  MontaSelect4.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' + sPlanoOrc);

  lblBenef.Visible  := (ItemBenef = 0);
  dblcBenef.Visible := (ItemBenef = 0);

  DecodeDate(Date, wAno, wMes, wDia);

  if (wMes + NumMeses - 1 > 12) then
  begin
     wMes := 1;
     inc(wAno);
  end;

  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value := wAno;

end;

procedure TfrmLancaOrcam.bbtnConfirmarClick(Sender: TObject);
var
  sMesRef, sDataRef : String;
  Ind, iAno, iMes, iConta: Integer;
begin
  inherited;
  for Ind := 0 to NumMeses - 1 do
  begin
     iMes := cmbMes.ItemIndex + 1 + Ind;
     iAno := spnedAno.Value;
     if iMes > 12 then
     begin
       iMes := iMes - 12;
       inc(iAno);
     end;
     sMesRef := IntToStr(iAno) + '/';
     if iMes <= 9
     then sMesRef := sMesRef + '0'+IntToStr(iMes)
     else sMesRef := sMesRef + IntToStr(iMes);

     sDataRef := DateToStr(TrazUltDiaData(StrToDate('01/'+copy(sMesRef,6,2)+'/'+copy(sMesRef,1,4))));

     // Numero de Empregados
     dtmBaseDados.qry.Close;
     with (dtmBaseDados.qry.SQL) do
     if (dblcNumero.Text <> '') then
     begin
       Clear;
       Add('SELECT COUNT(VLRORCADO) AS CONTA ');
       Add('FROM SALDOORCADO ');
       Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
       Add('AND   IDPLANOORCAMEN = ' + sPlanoOrc);
       Add('AND   IDCONTAORCAMEN = ' + QuotedStr(MontaSelect1.ValoresChave[0]));
       Add('AND   TO_CHAR(DATAREFERENCIA,''YYYY/MM'') = ' + QuotedStr(sMesRef));

       dtmBaseDados.qry.Open;
       iConta := dtmBaseDados.qry.FieldByName('CONTA').AsInteger;
       dtmBaseDados.qry.Close;

       if (iConta > 0) then
       begin
           Clear;
           Add('UPDATE SALDOORCADO ');
           Add('SET VLRORCADO = ROUND(' + IntToStr(NumPessoas[Ind+1]) + '/' + IntToStr(iConta) + ',0)');
           Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
           Add('AND   IDPLANOORCAMEN = ' + sPlanoOrc);
           Add('AND   IDCONTAORCAMEN = ' + QuotedStr(MontaSelect1.ValoresChave[0]));
           Add('AND   TO_CHAR(DATAREFERENCIA,''YYYY/MM'') = ' + QuotedStr(sMesRef));
           try
             dtmBaseDados.qry.ExecSQL;
           except
           end;
       end
       else begin
           Clear;
           Add('INSERT INTO SALDOORCADO ');
           Add('(VLRORCADO,IDPESSOA,IDPLANOORCAMEN,IDCONTAORCAMEN,DATAREFERENCIA,PERIODO,EXERCICIO) ');
           Add('VALUES (' + IntToStr(NumPessoas[Ind+1]));
           Add(','+ IntToStr(Sistema.IdEmpresa));
           Add(','+ sPlanoOrc);
           Add(','+ QuotedStr(MontaSelect1.ValoresChave[0]));
           Add(', TO_DATE(' + QuotedStr(sDataRef) + ',''DD/MM/YYYY'')');
           Add(','+ IntToStr(iMes));
           Add(','+ IntToStr(iAno) + ')');
           try
             dtmBaseDados.qry.ExecSQL;
           except
           end;
       end;
       dtmBaseDados.qry.Close;
     end;

     // Salários
     dtmBaseDados.qry.Close;
     with (dtmBaseDados.qry.SQL) do
     if (dblcSalario.Text <> '') then
     begin
       Clear;
       Add('SELECT COUNT(VLRORCADO) AS CONTA ');
       Add('FROM SALDOORCADO ');
       Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
       Add('AND   IDPLANOORCAMEN = ' + sPlanoOrc);
       Add('AND   IDCONTAORCAMEN = ' + QuotedStr(MontaSelect2.ValoresChave[0]));
       Add('AND   TO_CHAR(DATAREFERENCIA,''YYYY/MM'') = ' + QuotedStr(sMesRef));

       dtmBaseDados.qry.Open;
       iConta := dtmBaseDados.qry.FieldByName('CONTA').AsInteger;
       dtmBaseDados.qry.Close;

       if (iConta > 0) then
       begin
           Clear;
           Add('UPDATE SALDOORCADO ');
           Add('SET VLRORCADO = ROUND(' + OraNumero(FloatToStr(ValSalario[Ind+1])) + '/' + IntToStr(iConta) + ',2)');
           Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
           Add('AND   IDPLANOORCAMEN = ' + sPlanoOrc);
           Add('AND   IDCONTAORCAMEN = ' + QuotedStr(MontaSelect2.ValoresChave[0]));
           Add('AND   TO_CHAR(DATAREFERENCIA,''YYYY/MM'') = ' + QuotedStr(sMesRef));
           try
             dtmBaseDados.qry.ExecSQL;
           except
           end;
       end
       else begin
           Clear;
           Add('INSERT INTO SALDOORCADO ');
           Add('(VLRORCADO,IDPESSOA,IDPLANOORCAMEN,IDCONTAORCAMEN,DATAREFERENCIA,PERIODO,EXERCICIO) ');
           Add('VALUES (ROUND(' + OraNumero(FloatToStr(ValSalario[Ind+1])));
           Add(',2),'+ IntToStr(Sistema.IdEmpresa));
           Add(','+ sPlanoOrc);
           Add(','+ QuotedStr(MontaSelect2.ValoresChave[0]));
           Add(', TO_DATE(' + QuotedStr(sDataRef) + ',''DD/MM/YYYY'')');
           Add(','+ IntToStr(iMes));
           Add(','+ IntToStr(iAno) + ')');
           try
             dtmBaseDados.qry.ExecSQL;
           except
           end;
       end;
       dtmBaseDados.qry.Close;
     end;

     // Encargos
     dtmBaseDados.qry.Close;
     with (dtmBaseDados.qry.SQL) do
     if (dblcEncargo.Text <> '') then
     begin
       Clear;
       Add('SELECT COUNT(VLRORCADO) AS CONTA ');
       Add('FROM SALDOORCADO ');
       Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
       Add('AND   IDPLANOORCAMEN = ' + sPlanoOrc);
       Add('AND   IDCONTAORCAMEN = ' + QuotedStr(MontaSelect3.ValoresChave[0]));
       Add('AND   TO_CHAR(DATAREFERENCIA,''YYYY/MM'') = ' + QuotedStr(sMesRef));

       dtmBaseDados.qry.Open;
       iConta := dtmBaseDados.qry.FieldByName('CONTA').AsInteger;
       dtmBaseDados.qry.Close;

       if (iConta > 0) then
       begin
           Clear;
           Add('UPDATE SALDOORCADO ');
           Add('SET VLRORCADO = ROUND(' + OraNumero(FloatToStr(ValEncargo[Ind+1])) + '/' + IntToStr(iConta) + ',2)');
           Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
           Add('AND   IDPLANOORCAMEN = ' + sPlanoOrc);
           Add('AND   IDCONTAORCAMEN = ' + QuotedStr(MontaSelect3.ValoresChave[0]));
           Add('AND   TO_CHAR(DATAREFERENCIA,''YYYY/MM'') = ' + QuotedStr(sMesRef));
           try
             dtmBaseDados.qry.ExecSQL;
           except
           end;
       end
       else begin
           Clear;
           Add('INSERT INTO SALDOORCADO ');
           Add('(VLRORCADO,IDPESSOA,IDPLANOORCAMEN,IDCONTAORCAMEN,DATAREFERENCIA,PERIODO,EXERCICIO) ');
           Add('VALUES (ROUND(' + OraNumero(FloatToStr(ValEncargo[Ind+1])));
           Add(',2),'+ IntToStr(Sistema.IdEmpresa));
           Add(','+ sPlanoOrc);
           Add(','+ QuotedStr(MontaSelect3.ValoresChave[0]));
           Add(', TO_DATE(' + QuotedStr(sDataRef) + ',''DD/MM/YYYY'')');
           Add(','+ IntToStr(iMes));
           Add(','+ IntToStr(iAno) + ')');
           try
             dtmBaseDados.qry.ExecSQL;
           except
           end;
       end;
       dtmBaseDados.qry.Close;
     end;

     // Benefícios
     dtmBaseDados.qry.Close;
     with (dtmBaseDados.qry.SQL) do
     if (dblcBenef.Text <> '') and (ItemBenef = 0) then
     begin
       Clear;
       Add('SELECT COUNT(VLRORCADO) AS CONTA ');
       Add('FROM SALDOORCADO ');
       Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
       Add('AND   IDPLANOORCAMEN = ' + sPlanoOrc);
       Add('AND   IDCONTAORCAMEN = ' + QuotedStr(MontaSelect4.ValoresChave[0]));
       Add('AND   TO_CHAR(DATAREFERENCIA,''YYYY/MM'') = ' + QuotedStr(sMesRef));

       dtmBaseDados.qry.Open;
       iConta := dtmBaseDados.qry.FieldByName('CONTA').AsInteger;
       dtmBaseDados.qry.Close;

       if (iConta > 0) then
       begin
           Clear;
           Add('UPDATE SALDOORCADO ');
           Add('SET VLRORCADO = ROUND(' + OraNumero(FloatToStr(ValBenef[Ind+1])) + '/' + IntToStr(iConta) + ',2)');
           Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
           Add('AND   IDPLANOORCAMEN = ' + sPlanoOrc);
           Add('AND   IDCONTAORCAMEN = ' + QuotedStr(MontaSelect4.ValoresChave[0]));
           Add('AND   TO_CHAR(DATAREFERENCIA,''YYYY/MM'') = ' + QuotedStr(sMesRef));
           try
             dtmBaseDados.qry.ExecSQL;
           except
           end;
       end
       else begin
           Clear;
           Add('INSERT INTO SALDOORCADO ');
           Add('(VLRORCADO,IDPESSOA,IDPLANOORCAMEN,IDCONTAORCAMEN,DATAREFERENCIA,PERIODO,EXERCICIO) ');
           Add('VALUES (ROUND(' + OraNumero(FloatToStr(ValBenef[Ind+1])));
           Add(',2),'+ IntToStr(Sistema.IdEmpresa));
           Add(','+ sPlanoOrc);
           Add(','+ QuotedStr(MontaSelect4.ValoresChave[0]));
           Add(', TO_DATE(' + QuotedStr(sDataRef) + ',''DD/MM/YYYY'')');
           Add(','+ IntToStr(iMes));
           Add(','+ IntToStr(iAno) + ')');
           try
             dtmBaseDados.qry.ExecSQL;
           except
           end;
       end;
       dtmBaseDados.qry.Close;
     end;

  end;

end;

end.
