unit uUsoPessoal;

interface

Uses Classes, uFormManager, wwQuery, Forms, SysUtils, Dialogs;

Type
  str2   = string[2];

  TUsoPessoal = Class
  Private
    FChavePessoa: LongInt;
    procedure SetChavePessoa(const Value: LongInt);
    function ColocaBarra(Data: string): string;
    function AnoBissexto(Ano: integer): boolean;

  Public
     Constructor Create;

     Class Function ExisteRh :Boolean;

     Procedure Execute;
     function TiraCaracter(Texto: string; Ch: char): string;
     function TrazUltDiaMes(Mes, Ano: integer): integer;
     function TiraBarra (Data: string): string;

     function IFF (Condicao:boolean; Primeiro,Segundo:string): string; overload;
     function IFF (Condicao:boolean; Primeiro,Segundo:integer): integer; overload;
     function IFF (Condicao:boolean; Primeiro,Segundo:double): double; overload;

     function IFF_Int(Condicao:boolean; Primeiro,Segundo:integer): integer;
     function IFF_Float(Condicao:boolean; Primeiro,Segundo:double): double;
     function IncData (Data:string; Dias,Meses,Anos:integer): string;
     function PoeZero (Num: byte): str2;

     Property ChavePessoa :LongInt read FChavePessoa write SetChavePessoa;
  End;

  Var
    UsoPessoal :TUsoPessoal;

implementation

Uses FIdentPessoal, FUsoPessoal, uMensErro, uSistema, uCtrlPadroes, DbClient;

{ TUsoPessoal }

constructor TUsoPessoal.Create;
begin
  FChavePessoa := 0;
end;

class function TUsoPessoal.ExisteRh: Boolean;
begin
  With TClientDataSet.Create(nil) Do
    Try
       Data := Padroes.GetDataPacket('SELECT FLGSENHAUSOPES FROM PARAMRH');
       Result := (Not IsEmpty) And (Fields[0].AsInteger <> 2);
    finally
       Free;
    End;
end;

procedure TUsoPessoal.Execute;
Var
  qryUsuPessoal: TwwQuery;
  GuardaFlgSenha: integer;
begin
  inherited;
  FChavePessoa := 0;

  qryUsuPessoal := TwwQuery.Create(Application);
  qryUsuPessoal.DataBaseName := 'Basedados';

  qryUsuPessoal.Close;
  qryUsuPessoal.SQL.Clear;
  qryUsuPessoal.SQL.Add('SELECT FLGSENHAUSOPES FROM PARAMRH');
  qryUsuPessoal.Open;
  GuardaFlgSenha := qryUsuPessoal.FieldByName('FLGSENHAUSOPES').AsInteger;

  // Chamada da Identificação do Empregado
  if (GuardaFlgSenha > 0) then
  begin
    qryUsuPessoal.Close;
    qryUsuPessoal.SQL.Clear;
    qryUsuPessoal.SQL.Add('SELECT IDPESSOA FROM FUNCIONARIO WHERE (IDPESSOA = ' +
      IntToStr(Sistema.idUsuario)+ ')');
    qryUsuPessoal.Open;

    FChavePessoa := qryUsuPessoal.FieldByName('IDPESSOA').asInteger;

    if (FChavePessoa = 0) then
      if (GuardaFlgSenha = 3) then
        AbrirFormModal(frmIdentPessoal, TfrmIdentPessoal)
      else
        MsgDlg('Usuário não é empregado. Acesso negado', 'Informação',mtInformation,[mbOk,mbHelp],0);
  end
  else
    AbrirFormModal(frmIdentPessoal, TfrmIdentPessoal);

  qryUsuPessoal.Close;
  qryUsuPessoal.Free;

  if (FChavePessoa > 0) then
    AbrirForm(frmUsoPessoal, TfrmUsoPessoal, false);
end;

function TUsoPessoal.IFF_Float(Condicao: boolean; Primeiro,
  Segundo: double): double;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function TUsoPessoal.IFF_Int(Condicao: boolean; Primeiro,
  Segundo: integer): integer;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function TUsoPessoal.PoeZero(Num: byte): str2;
var
  sAux: str2;
begin
  if (Num < 10) then
    sAux := '0'+IntToStr(Num)
  else
    sAux := IntToStr(Num);
  PoeZero := sAux;
end;

procedure TUsoPessoal.SetChavePessoa(const Value: LongInt);
begin
  FChavePessoa := Value;
end;

function TUsoPessoal.IncData(Data: string; Dias, Meses,
  Anos: integer): string;
var
  Posic: byte;
  iDia,iMes,iAno,c: integer;
begin
  if (Trim(Data) <> '') then
  begin
    Posic := Pos('/',Data);

    if (Posic > 0) then
      Data := TiraBarra(Data);

    iDia := StrToIntDef(Copy(Data,1,2),0);
    iMes := StrToIntDef(Copy(Data,3,2),0);
    iAno := StrToIntDef(Copy(Data,5,4),0);

    // Modifico os Anos
    iAno := iAno + Anos;

    // Modifico os Meses
    if (Meses > 0) then // Soma Mês
    begin
      for c:=0 to Meses-1 do
      begin
        iMes := iMes + 1;
        if (iMes = 13) then
        begin
          iMes := 1;
          iAno := iAno + 1;
        end;
      end;
    end
    else
    if (Meses < 0) then // Subtrai Mês
    begin
      for c:=0 DownTo Meses+1 do
      begin
        iMes := iMes - 1;
        if (iMes = 0) then
        begin
          iMes := 12;
          iAno := iAno - 1;
        end;
      end;
    end;

    // Testa Validade do Último Dia do Mês
    if (iDia > TrazUltDiaMes(iMes,iAno)) then
      iDia := TrazUltDiaMes(iMes,iAno);
    
    // Modifico os Dias
    if (Dias > 0) then // Soma Dias
    begin
      for c:=0 to Dias-1 do
        if (iDia = TrazUltDiaMes(iMes,iAno)) then
        begin
          iDia := 1;
          iMes := iMes + 1;
          if (iMes = 13) then
          begin
            iMes := 1;
            iAno := iAno + 1;
          end;
        end
        else
          iDia := iDia + 1;
    end
    else
    if (Dias < 0) then // Subtrai Dias
    begin
      for c:=0 DownTo Dias+1 do
        if (iDia = 1) then // Primeiro Dia do Mês
        begin
          iMes := iMes - 1;
          if (iMes = 0) then
          begin
            iMes := 12;
            iAno := iAno - 1;
          end;
          iDia := TrazUltDiaMes(iMes,iAno);
        end
        else
          iDia := iDia - 1;
    end;

    // Monta Data
    Data := PoeZero(iDia) + PoeZero(iMes) + IntToStr(iAno);

    // Coloca Barras
    if (Posic > 0) then
      Data := ColocaBarra(Data);

    Result := Data;
  end
  else
    Result := '';
end;

function TUsoPessoal.TiraBarra(Data: string): string;
begin
  Result := TiraCaracter(Data,'/');
end;

function TUsoPessoal.TiraCaracter(Texto:string; Ch:char): string;
var
  Posic: byte;
begin
  Posic := Pos (Ch,Texto);
  if (Posic > 0) then
  begin
    Delete (Texto,Posic,1);
    Posic := Pos (Ch,Texto);
    if (Posic > 0) then
      Delete (Texto,Posic,1);
  end;
  Result := Texto;
end;

function TUsoPessoal.TrazUltDiaMes(Mes,Ano: integer): integer;
Type
  TDiaMes  = array[1..12] of integer;
  
var
  mDiaMes: TDiaMes;
begin
  mDiaMes[01] := 31;
  mDiaMes[02] := StrToIntDef(IFF(AnoBissexto(Ano),'29','28'),0);
  mDiaMes[03] := 31;
  mDiaMes[04] := 30;
  mDiaMes[05] := 31;
  mDiaMes[06] := 30;
  mDiaMes[07] := 31;
  mDiaMes[08] := 31;
  mDiaMes[09] := 30;
  mDiaMes[10] := 31;
  mDiaMes[11] := 30;
  mDiaMes[12] := 31;
  TrazUltDiaMes := mDiaMes[Mes];
end;

function TUsoPessoal.ColocaBarra (Data: string): string;
begin
  Result := Data;
  if (Pos('/',Data) = 0) then
    Result := Copy(Data,1,2)+'/'+ Copy(Data,3,2)+'/'+ Copy(Data,5,4);
end;

function TUsoPessoal.IFF(Condicao:boolean; Primeiro,Segundo:string): string;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function TUsoPessoal.IFF(Condicao:boolean; Primeiro,Segundo:integer): integer;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function TUsoPessoal.IFF(Condicao:boolean; Primeiro,Segundo:double): double;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function TUsoPessoal.AnoBissexto(Ano: integer): boolean;
begin
  Result := ((Ano mod 4) = 0);
end;


end.
