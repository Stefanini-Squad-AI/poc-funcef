unit Principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, StdCtrls, ExtCtrls, Db, DBTables, Grids, DBGrids, uRegra,
  TB97, CmDock, Wwquery;

type
  TFrmComparaValores = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Boleto1: TMenuItem;
    Sobre1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    Bevel1: TBevel;
    QryPart: TQuery;
    Od: TOpenDialog;
    QryPartCDFUN: TStringField;
    QryPartCDPAT: TStringField;
    QryPartNRISC: TFloatField;
    QryPartTPSITPAR: TStringField;
    QryPartIDSEGVIDA: TStringField;
    QryPartDTINIVIGSEGVIDA: TStringField;
    QryPartIDSEGSAUQTCOL: TStringField;
    QryPartDTINIVIGSEGSAUQTCOL: TStringField;
    QryPartIDSEGSAUQTPRI: TStringField;
    QryPartDTINIVIGSAUQTPRI: TStringField;
    QryPartIDSEGDENBAS: TStringField;
    QryPartDTINIVIGDENBAS: TStringField;
    QryPartIDSEGDENESP: TStringField;
    QryPartDTINIVIGDENESP: TStringField;
    QryPartIDSEGFUNFAM: TStringField;
    QryPartDTINIVIGPLAFUN: TStringField;
    QryPartIDSEGFUNIND: TStringField;
    QryPartDTINIVIGFUNIND: TStringField;
    LerArquivo1: TMenuItem;
    Qry: TQuery;
    TableDados: TTable;
    DataSourceDados: TDataSource;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    LabelTotal: TLabel;
    QryMATRICULA: TStringField;
    QryNOME: TStringField;
    QryIDPESSJUR: TFloatField;
    QryINSCRICAONUMERO: TFloatField;
    QryIDPLANOPREV: TFloatField;
    QryPREVIDENCIARIO: TStringField;
    QryPATROCINADORA: TStringField;
    QryINSCRICAODATA: TDateTimeField;
    QryIDPESSOA: TFloatField;
    QryRESPONSAVEL_GRUPO: TStringField;
    QryIDNUCLEO: TFloatField;
    QryIDRESPONSAVEL: TFloatField;
    QrySITUACAO: TStringField;
    ProgressBar: TProgressBar;
    TableDadosMATRICULA: TStringField;
    TableDadosCPF: TStringField;
    TableDadosNOME: TStringField;
    TableDadosPREMIOVG: TFloatField;
    TableDadosPREMIOAP: TFloatField;
    TableDadosCAPITALMN: TFloatField;
    TableDadosCAPITALIP: TFloatField;
    TableDadosCAPITALMA: TFloatField;
    TableDadosDATAADESAO: TDateField;
    TableDadosSUBESTIPUL: TStringField;
    TableDadosAPOLICE: TStringField;
    TableDadosFORMAPAGTO: TStringField;
    QRYREG: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    qryIdRegra: TQuery;
    QRYREGRAIN: TwwQuery;
    qryIdRegraIDTITULAR: TFloatField;
    qryIdRegraIDPESSJUR: TFloatField;
    qryIdRegraIDPLANOPREV: TFloatField;
    qryIdRegraIDPLANASS: TFloatField;
    qryIdRegraIDREGRA: TFloatField;
    qryIdRegraIDDEPENDENTE: TFloatField;
    QRYREGRAINHAVEDEPLEGAL: TFloatField;
    QRYREGRAINIDPESSOA: TFloatField;
    QRYREGRAINNUMDOCUMENTO: TStringField;
    QRYREGRAINDATANASC: TDateTimeField;
    QRYREGRAINSEXO: TStringField;
    QRYREGRAINESTCIVIL: TStringField;
    QRYREGRAINDATAMORTE: TDateTimeField;
    QRYREGRAINIDDEPENDENCIA: TStringField;
    QRYREGRAINIDTITULAR: TFloatField;
    QRYREGRAINIDPESSOA_1: TFloatField;
    QRYREGRAINIDSITDEPENDENTE: TStringField;
    QRYREGRAINIDPLANASS: TFloatField;
    QRYREGRAINIDPLANOPREV: TFloatField;
    QRYREGRAINIDPESSJUR: TFloatField;
    QRYREGRAINSEQPROPOSTA: TFloatField;
    QRYREGRAINDATAENTRADA: TDateTimeField;
    QRYREGRAINMESENTRADA: TStringField;
    QRYREGRAINFLGINSCRICAOCANC: TFloatField;
    QRYREGRAININSCRICAONUMERO: TStringField;
    QRYREGRAINDATACANCELAMENTO: TDateTimeField;
    QRYREGRAINFLGPARTBENEF: TStringField;
    QRYREGRAINFLGFUNCIONARIO: TFloatField;
    QRYREGRAINMATRICULA: TStringField;
    QRYREGRAINDATAADMISSAO: TDateTimeField;
    QRYREGRAINNIVEL: TStringField;
    QRYREGRAINTEMPOSERVANTERIOR: TFloatField;
    QRYREGRAINTEMPONAOCREDITADO: TFloatField;
    QRYREGRAINTEMPOSERVANTREAL: TFloatField;
    QRYREGRAINTEMPOSITESPECIAL: TFloatField;
    QRYREGRAINVALORBASE1: TFloatField;
    QRYREGRAINVALORBASE2: TFloatField;
    QRYREGRAINVALORBASE3: TFloatField;
    QRYREGRAINNIVEL_1: TStringField;
    QRYREGRAINMESREF: TStringField;
    QRYREGRAINSALPARTICIPACAO: TFloatField;
    QRYREGRAINSALMANTIDO: TFloatField;
    QRYREGRAINSALBENEFICIO: TFloatField;
    QRYREGRAINSALREFERENCIA: TFloatField;
    QRYREGRAINIDSITFUNC: TFloatField;
    QRYREGRAINDATADEMISSAO: TDateTimeField;
    QRYREGRAINIDSITPART: TFloatField;
    QRYREGRAINFLGINTERNO: TStringField;
    QRYREGRAINSALARIOATUAL: TFloatField;
    QRYREGRAINFLGDEPLEGAL: TFloatField;
    QRYREGRAINRESPONSAVELPAG: TFloatField;
    QRYREGRAINOPCAOA: TStringField;
    QRYREGRAINOPCAOB: TStringField;
    procedure Sair1Click(Sender: TObject);
    procedure LerArquivo1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    { Private declarations }
    Procedure CalculaContribuicao;
  public
    { Public declarations }
  end;

var
  FrmComparaValores: TFrmComparaValores;
  Regra: TRegra;
  Inicio      : Boolean;
  ValorCalculado,
  Diferenca : Double;
  VNome,sSql     : String;
  VResult,
  Lister         : Textfile;
  iValor         : Integer;
  iPremioVg      : Double;
  sPlano         : String;
  sNome          : String;
  iCount         : Integer;


implementation

USES UADMASS;
{$R *.DFM}

Procedure TFrmComparaValores.CalculaContribuicao;
Var ErroRegra: Boolean;
begin
  Regra:=TRegra.Create(Nil);
  ErroRegra:=False;
  ValorCalculado:=0;

  (* Identificação da Regra *)
  qryIdRegra.Close;
  qryIdRegra.ParamByName('IDTITULAR').asInteger := StrToIntDef(qry.FieldByName('IDPESSOA').AsString,0);
  qryIdRegra.ParamByName('IDPLANASS').asInteger := StrToIntDef(sPlano,0);
  qryIdRegra.Open;
  If (qryIdRegra.IsEmpty)Or
      (Trim(qryIdRegra.FieldByName('IDREGRA').AsString) = '') then
  begin
    ErroRegra:=True;
    qryIdRegra.Close;
  end;

  Regra.Activated:=False;
  Regra.DataBaseName:='BaseDados';
  Regra.queryIn:= qryRegraIn;

  qryRegraIn.Close;
  qryRegraIn.ParamByName('IDTITULAR').Value    := StrToIntDef(qryIdRegra.FieldByName('IDTITULAR').AsString,0);
  qryRegraIn.ParamByName('IDDEPENDENTE').Value := StrToIntDef(qryIdRegra.FieldByName('IDDEPENDENTE').AsString,0);
  qryRegraIn.ParamByName('IDPESSJUR').Value    := StrToIntDef(qryIdRegra.FieldByName('IDPESSJUR').AsString,0);
  qryRegraIn.ParamByName('IDPLANOPREV').Value  := StrToIntDef(qryIdRegra.FieldByName('IDPLANOPREV').AsString,0);
  qryRegraIn.ParamByName('IDPLANASS').Value    := StrToIntDef(sPlano,0);
  qryRegraIn.ParamByName('MESREF').Value       := Copy(DateToStr(Date),7,4)+'/'+Copy(DateToStr(Date),4,2);
  try
    qryRegraIn.Open;
  except
    on E:Exception do ErroRegra:=True;
  end; {try..except}
  Regra.RuleName := qryIdRegra.FieldByName('IDREGRA').AsString;
  try
    Regra.Execute;
  except
    on E:Exception do ErroRegra:=True;
  end; {try..except}

  (* Verifica o valor de Resultado da Regra *)
  If regra.Result = 'N' then ErroRegra:=True
  else ValorCalculado:= StrFloat(ClienteNumero(regra.Result),0);

  Regra.Activated:=False;
  Regra.Free;

  If ErroRegra then ValorCalculado:=0;

  Diferenca:=IpremioVg-ValorCalculado;
  If (Diferenca >= 0.05) or (Diferenca <= -0.05) then
     Writeln(Lister,TableDados.FieldByName('MATRICULA').AsString,
      '':12-Length(TableDados.FieldByName('MATRICULA').AsString),
      ' - ',sNome,'':45-Length(sNome),
       '   ',IntToStr(iValor),'':12-Length(IntToStr(iValor)),'   ',
       FloatToStr(ValorCalculado),'':14-Length(FloatToStr(ValorCalculado)),'   ',
        FloatToStr(iPremioVG),'':14-Length(FloatToStr(iPremioVg)),'   ',FloatToStr(Diferenca));
end;

procedure TFrmComparaValores.Sair1Click(Sender: TObject);
begin
  if MessageDlg('Deseja encerrar o programa ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then Close;
end;

procedure TFrmComparaValores.LerArquivo1Click(Sender: TObject);
Var Continuar : Boolean;
begin
  If Not Inicio then Exit;
  Inicio:=False;

  Screen.Cursor  := crHourglass;
  ProgressBar.Max:=TableDados.RecordCount;
  VNome:='c:\projetoscm5\assistencial\CompPremio\dados\erros.txt';
  AssignFile(VResult,VNome);
  ReWrite(VResult);

  AssignFile(Lister,'c:\projetoscm5\assistencial\CompPremio\dados\DifPr.txt');
  ReWrite(Lister);
  Writeln(Lister,'MATRICULA    NOME                    FAIXA      VALOR CALCULADO'+
           'VALOR PREMIO      DIFERENCA');
  Writeln(Lister);

  iCount:=0;

  TableDados.First;

  Continuar:=False;

   While (Not TableDados.Eof) do
    Begin

      Inc(iCount,1);

      If Copy(TableDados.FieldByName('MATRICULA').AsString,1,8)='00003934' then Continuar:=True;




      If Continuar then
      begin

        ProgressBar.Position:=iCount;

        Qry.Close;
        Qry.ParamByName('PINSCRICAO').Value:=Copy(TableDados.FieldByName('MATRICULA').AsString,1,8);
        Qry.Open;
        If Qry.RecordCount = 0 Then
          WriteLn(VResult,'Erro no participante '+
                        TableDados.FieldByName('NOME').AsString+' - Inscrição nº '+
                        TableDados.FieldByName('MATRICULA').AsString+' inexistente.')
        Else
        Begin
          sNome:=TableDados.FieldByName('Nome').AsString;

          iValor:=TableDados.FieldByName('CAPITALIP').AsInteger;

          Case iValor of
            100000 : sPlano:='95';   {Conforme o IdPlanass}
             84000 : sPlano:='97';
             67000 : sPlano:='99';
             50000 : sPlano:='101';
             33200 : sPlano:='75';
             29000 : sPlano:='77';
             24000 : sPlano:='79';
             20000 : sPlano:='81';
             15600 : sPlano:='83';
             12000 : sPlano:='85';
              9600 : sPlano:='87';
              7600 : sPlano:='89';
              4600 : sPlano:='91';
              3600 : sPlano:='93';
            else
             begin
               WriteLn(VResult,'Erro no participante '+sNome+' - Inscrição nº '+
                         TableDados.FieldByName('MATRICULA').AsString+' inexistente.');
               Continue;
             end;
          End; {Case}

         (* Trabalha a variavel de cobrança diferenciada - OPCAOA da PARTASS *)

     (* O VALOR DOS DOIS CAMPOS SERAO SOMADOS PARA ATINGIR A FAIXA DA TABELA DE CAPITAIS *)
          IPremioVg:=TableDados.FieldByName('PREMIOVG').AsFloat+
           TableDados.FieldByName('PREMIOAP').AsFloat;

          (* FAZ O CALCULO, COMPARA E GRAVA ERROS *)
          CalculaContribuicao;

         // StatusBar1.Panels[0].Text:=sNome+' - Verificando Valores';
         // Application.ProcessMessages;

        end; {Qry.RecordCount}
      end; {Continuar}
      TableDados.Next;
    End; {While}
    CloseFile(VResult);
    CloseFile(Lister);
  end;

procedure TFrmComparaValores.FormCreate(Sender: TObject);
begin
  TableDados.Close;
  TableDados.TableName:='c:\projetoscm5\assistencial\CompPremio\dados\refer.dbf';
  TableDados.Open;
  LabelTotal.Caption:='Total de Registros: '+IntToStr(TableDados.RecordCount);
  Inicio:=True;
end;

procedure TFrmComparaValores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TableDados.Close;
end;

end.

