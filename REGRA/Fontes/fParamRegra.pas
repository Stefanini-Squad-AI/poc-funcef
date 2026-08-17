unit fParamRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, DBTables, Db, Wwdatsrc, Wwquery, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, DBCtrls, uGlobal;

type
  TfrmParamRegra = class(TfrmSairAjuda)
    Qry: TwwQuery;
    ds: TwwDataSource;
    Upd: TUpdateSQL;
    GroupBox1: TGroupBox;
    dbrbCampo: TDBRadioGroup;
    dbrbVariavel: TDBRadioGroup;
    SbtnAlterar: TSpeedButton;
    QryDet: TwwQuery;
    dsDet: TwwDataSource;
    updDet: TUpdateSQL;
    QryAux: TwwQuery;
    sbtnAcertar: TSpeedButton;
    QryFormulas: TwwQuery;
    dsFormulas: TwwDataSource;
    udpFormula: TUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SbtnAlterarClick(Sender: TObject);
    procedure AtribuiValores;
    procedure AtualizaDescr;
    function TrocaPontoVirgula(Value: String): String;
    function DescricaoId(Id : String) : String;
    procedure BuscaFlags;
    procedure sbtnAcertarClick(Sender: TObject);
    function tiraTodosBrancos(Value: String): String;
    Function TiraPlic(texto:string):string;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRegra: TfrmParamRegra;
  FlgCmp, FlgVar : LongInt;
  vDesc, vAux1, vAux2 : String;
  Atualizou : Boolean;

implementation

uses fAguarde, uMensErro;

{$R *.DFM}

procedure TfrmParamRegra.FormCreate(Sender: TObject);
begin
  inherited;
  { Abre a query de Parametros }
  Qry.Close;
  Qry.Open;
  { Caso não tenha parametros cadastrados, Insere um registro }
  If Qry.IsEmpty then begin
    Qry.Insert;
    Qry.FieldbyName('FLGCAMPO').AsInteger    := 0;
    Qry.FieldbyName('FLGVARIAVEL').AsInteger := 0;
  End Else
  { Caso jé tenha altera }
    Qry.Edit;
end;

procedure TfrmParamRegra.FormClose(Sender: TObject; Var Action: TCloseAction);
begin
  inherited;
  { Confirma as Alterações no Banco de Dados }
  if not Atualizou then begin
    if Qry.State in [dsEdit,dsInsert] then begin
      try
        Qry.Post;
        Qry.ApplyUpDates;
      except
        begin
          MsgDlg('Não foi possível gravar a parametrização.','Erro',mtConfirmation,[mbOk,mbHelp],0);
        end;
      end;
    end;
  end;
end;

procedure TfrmParamRegra.SbtnAlterarClick(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Gravando Parametrização ...');
  frmAguarde.Refresh;
  if Qry.State in [dsEdit,dsInsert] then begin
     Qry.Post;
     Qry.ApplyUpDates;
  end;
  Qry.Edit;

  frmAguarde.Refresh;
  QryDet.Close;
  QryDet.Open;
  frmAguarde.Max := QryDet.RecordCount;
  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;

  frmAguarde.Mostra('Alterando Passos das Regras ...');
  frmAguarde.Refresh;

  while not QryDet.Eof do begin
        frmAguarde.Pos := frmAguarde.Pos + 1;
        if (QryDet.FieldbyName('TIPOALGORITMO').AsInteger <> 9) and
           (QryDet.FieldbyName('TIPOALGORITMO').AsInteger <> 15) and
           (QryDet.FieldbyName('TIPOALGORITMO').AsInteger <> 12) then begin
           AtribuiValores;
           AtualizaDescr;
           if vDesc <> '' then begin
              QryDet.Edit;
              QryDet.FieldbyName('DESCRICAOALGORIT').AsString := vDesc;
              QryDet.Post;
           end;
        end;
        QryDet.Next;
  end;

  frmAguarde.Mostra('Aplicando Alterações ...');
  frmAguarde.Refresh;
  QryDet.ApplyUpDates;
  frmAguarde.Apaga;
  Atualizou := True;
end;

procedure TfrmParamRegra.AtribuiValores;
begin
     Case QryDet.FieldbyName('TIPOALGORITMO').AsInteger of
        1,2,11 : begin {Atribuicao de valores}
                       BuscaFlags;
                       Case QryDet.FieldbyName('TIPOCAMPO1').AsInteger of
                            1 : begin
                                if FlgCmp = 0 then vAux1 := DescricaoId(QryDet.FieldbyName('IDCAMPO').AsString)
                                   else vAux1 := QryDet.FieldbyName('IDCAMPO').AsString;
                                end;
                            2 : begin
                                     if FlgVar = 0 then vAux1 := DescricaoId(QryDet.FieldbyName('IDCAMPO').AsString)
                                        else vAux1 := QryDet.FieldbyName('IDCAMPO').AsString;
                                end;
                       end;

                       //Traz os valores de Campo2
                       Case QryDet.FieldbyName('TIPOCAMPO2').AsInteger of
                            1 : begin
                                if FlgCmp = 0 then vAux2 := DescricaoId(QryDet.FieldbyName('IDCAMPO2').AsString)
                                   else vAux2 := QryDet.FieldbyName('IDCAMPO2').AsString;
                                end;
                            2 : begin
                                     if FlgVar = 0 then vAux2 := DescricaoId(QryDet.FieldbyName('IDCAMPO2').AsString)
                                        else vAux2 := QryDet.FieldbyName('IDCAMPO2').AsString;
                                end;
                            3 : begin
                                     if QryDet.FieldbyName('VALOR').AsString <> '' then
                                        vAux2 := QryDet.FieldbyName('VALOR').AsString;
                                end;
                            4 : begin
                                     if QryDet.FieldbyName('FORMULA1').AsInteger > 0 then begin
                                        with QryAux do begin
                                             Close;
                                             Sql.Clear;
                                             Sql.Add('SELECT DESCRICAOFORMULA FROM FORMULA WHERE IDFORMULA='+QryDet.FieldbyName('FORMULA1').AsString);
                                             Open;
                                             if not IsEmpty then
                                                vAux2 := FieldbyName('DESCRICAOFORMULA').AsString;
                                        end;
                                     end;
                                end;
                       end;
                 end;
        3..8 : begin {Comparacao de valores}
                       BuscaFlags;
                       Case QryDet.FieldbyName('TIPOCAMPO1').AsInteger of
                            1 : begin
                                if FlgCmp = 0 then vAux1 := DescricaoId(QryDet.FieldbyName('IDCAMPO').AsString)
                                   else vAux1 := QryDet.FieldbyName('IDCAMPO').AsString;
                                end;
                            2 : begin
                                     if FlgVar = 0 then vAux1 := DescricaoId(QryDet.FieldbyName('IDCAMPO').AsString)
                                        else vAux1 := QryDet.FieldbyName('IDCAMPO').AsString;
                                end;
                       end;
                       Case QryDet.FieldbyName('TIPOCAMPO2').AsInteger of
                            1 : begin
                                if FlgCmp = 0 then vAux2 := DescricaoId(QryDet.FieldbyName('IDCAMPO2').AsString)
                                   else vAux2 := QryDet.FieldbyName('IDCAMPO2').AsString;
                                end;
                            2 : begin
                                     if FlgVar = 0 then vAux2 := DescricaoId(QryDet.FieldbyName('IDCAMPO2').AsString)
                                        else vAux2 := QryDet.FieldbyName('IDCAMPO2').AsString;
                                end;
                            3 : begin
                                     vAux2 := QryDet.FieldbyName('VALOR').AsString;
                                end;
                       end;
               end;
       10 : begin {Input}
                  BuscaFlags;
                  Case QryDet.FieldbyName('TIPOCAMPO1').AsInteger of
                       1 : begin
                                if FlgCmp = 0 then vAux1 := DescricaoId(QryDet.FieldbyName('IDCAMPO').AsString)
                                   else vAux1 := QryDet.FieldbyName('IDCAMPO').AsString;
                           end;
                       2 : begin
                                if FlgVar = 0 then vAux1 := DescricaoId(QryDet.FieldbyName('IDCAMPO').AsString)
                                   else vAux1 := QryDet.FieldbyName('IDCAMPO').AsString;
                           end;
                  end;
            end;
       13 : begin {mensagem}
                  BuscaFlags;
                  Case QryDet.FieldbyName('TIPOCAMPO1').AsInteger of
                       1 : begin
                                if FlgCmp = 0 then vAux1 := DescricaoId(QryDet.FieldbyName('IDCAMPO').AsString)
                                   else vAux1 := QryDet.FieldbyName('IDCAMPO').AsString;
                           end;
                       2 : begin
                                if FlgVar = 0 then vAux1 := DescricaoId(QryDet.FieldbyName('IDCAMPO').AsString)
                                   else vAux1 := QryDet.FieldbyName('IDCAMPO').AsString;
                           end;
                  end;
            end;
       14 : begin {Atribuição de regra}
                  BuscaFlags;
                  Case QryDet.FieldbyName('TIPOCAMPO1').AsInteger of
                       1 : begin
                                if FlgCmp = 0 then vAux1 := DescricaoId(QryDet.FieldbyName('IDCAMPO').AsString)
                                   else vAux1 := QryDet.FieldbyName('IDCAMPO').AsString;
                           end;
                       2 : begin
                                if FlgVar = 0 then vAux1 := DescricaoId(QryDet.FieldbyName('IDCAMPO').AsString)
                                   else vAux1 := QryDet.FieldbyName('IDCAMPO').AsString;
                           end;
                  end;
                  with QryAux do begin
                       Close;
                       Sql.Clear;
                       Sql.Add('SELECT NOMEREGRA FROM REGRA WHERE IDREGRA='+QryDet.FieldbyName('IDCAMPO2').AsString);
                       Open;
                       if not IsEmpty then
                          vAux2 := FieldbyName('NOMEREGRA').AsString;
                  end;
            end;
       16 : begin {gravar no demonstrativo de calculo}
                  BuscaFlags;
                  Case QryDet.FieldbyName('TIPOCAMPO1').AsInteger of
                       1 : begin
                                if FlgCmp = 0 then vAux1 := DescricaoId(QryDet.FieldbyName('IDCAMPO').AsString)
                                   else vAux1 := QryDet.FieldbyName('IDCAMPO').AsString;
                           end;
                       2 : begin
                                if FlgVar = 0 then vAux1 := DescricaoId(QryDet.FieldbyName('IDCAMPO').AsString)
                                   else vAux1 := QryDet.FieldbyName('IDCAMPO').AsString;
                           end;
                  end;
            end;
     End;
end;

procedure TfrmParamRegra.AtualizaDescr;
var
   sInicio, sFim : String;
begin
     vDesc := '';
     Case QryDet.FieldbyName('TIPOALGORITMO').AsInteger of
          1 : begin
                   sInicio := 'Atribuir à variável ';
                   if QryDet.FieldbyName('VALOR').AsString  <> '' then begin
                      vAux2 := QryDet.FieldbyName('VALOR').AsString;
                      sFim :=' o valor constante ';
                   end else
                       sFim :=' o valor da formula ';
                   vDesc := sInicio + vAux1 + sFim + vAux2;
              end;
          2 : begin
                   sInicio := 'Atribuir ao campo ';
                   if QryDet.FieldbyName('VALOR').AsString  <> '' then begin
                      vAux2 := QryDet.FieldbyName('VALOR').AsString;
                      sFim :=' o valor de '
                   end else sFim :=' o valor do Campo ';
                   vDesc := sInicio + vAux1 + sFim + vAux2;
              end;
          3..8 : vDesc := 'Se '+Trim(vAux1)+' '+Trim(QryDet.FieldbyName('CORRELACAO').AsString)+' '+
                          Trim(vAux2)+' então execute o passo '+
                          QryDet.FieldbyName('ALGORSUBSEQTRUE').AsString+' '+' senão,execute o passo '+
                          QryDet.FieldbyName('ALGORSUBSEQFALSE').AsString;
          10: vDesc := 'Imputar um Valor à variável '+vAux1+ ' com a Msg:'+QryDet.FieldbyName('VALOR').AsString;
          11: begin
                   if QryDet.FieldbyName('TIPOCAMPO1').AsInteger = 1 then sInicio := 'Atribuir ao campo '
                      else sInicio := 'Atribuir à variavel ';
                   if QryDet.FieldbyName('TIPOCAMPO2').AsInteger = 1 then sFim := ' o valor do campo '
                      else sFim := ' o valor da variável ';
                   vDesc := sInicio + vAux1 + sFim + vAux2;
              end;
          13: vDesc := 'Exibir a mensagem:'+QryDet.FieldbyName('VALOR').AsString+' '+vAux1;
          14: vDesc := 'Atribuir à variável ' +vAux1+' o valor da Regra: ' +vAux2;
          16: vDesc := 'Gravar na memoria de calculo: '+trocapontovirgula(QryDet.FieldbyName('VALOR').AsString)+' '+
                       vAux1;
     end;
end;

procedure TfrmParamRegra.BuscaFlags;
begin
  FlgCmp := Qry.FieldbyName('FLGCAMPO').AsInteger;
  FlgVar := Qry.FieldbyName('FLGVARIAVEL').AsInteger;
end;

function TfrmParamRegra.TrocaPontoVirgula(Value: String): String;
var
  iPosVirg : Integer;
begin
  iPosVirg := pos('.',Value);
  if iPosVirg <> 0 then
    Value := copy(Value,1,iPosVirg-1)+','+copy(Value,iPosVirg+1,length(Value));
  Result := Value;
end;

function TfrmParamRegra.DescricaoId(Id : String) : String;
begin
     with QryAux do begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT DESCRICAODOCAMPO FROM CMPBD WHERE IDCAMPO='''+Id+'''');
          Open;
     end;
     Result := QryAux.FieldbyName('DESCRICAODOCAMPO').AsString;
end;





procedure TfrmParamRegra.sbtnAcertarClick(Sender: TObject);
var
   sFormula, Letra, sPalavra, sFormulaP : String;
   Mudou : Boolean;
begin
  inherited;
  QryFormulas.Open;
  frmAguarde.Max := QryFormulas.RecordCount;
  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;

  frmAguarde.Mostra('Alterando Formulas ...');
  frmAguarde.Refresh;

  while not QryFormulas.Eof do begin
        sFormulaP := '';
        spalavra := '';
        sFormula := tiratodosbrancos(QryFormulas.FieldbyName('EXPRESSAOREAL').AsString);
        Mudou := False;
        if pos('CAMPOSDESC',QryFormulas.FieldbyName('EXPRESSAOFORMULA').AsString) =  0  then begin
           while sformula <> '' do begin
                 letra:=copy(sformula,1,1);
                 spalavra:=spalavra+letra;
                 sFormula := copy(sFormula,2,length(sFormula)-1);
                 if (pos(letra,'<>=+-*/(){}[],^')<> 0) or (sformula='') then begin
                    if pos(spalavra[length(spalavra)],'<>=+-*/(){}[],^')<> 0 then
                       spalavra:=copy(spalavra,1,length(spalavra)-1);
                    if trim(spalavra) <> '' then begin
                       if fazwwquery(QryAux,'select nomedocampo,apelido from cmpbd where UPPER(idcampo) = '''+
                          tiraplic(spalavra)+''' AND campodobanco >= 1 ') then begin
                          Mudou := True;
                          if trim(QryAux.fieldbyname('apelido').asString) <> '' then
                             sformulaP:=sformulaP+QryAux.fieldbyname('apelido').asString
                          else
                              if sformulaP+QryAux.fieldbyname('nomedocampo').asString <> '' then
                                 sformulaP:=sformulaP+QryAux.fieldbyname('nomedocampo').asString
                              else
                                  sformulaP:=sformulaP+spalavra;
                       end else
                           sformulaP:=sformulaP+spalavra;
                       spalavra:='';
                    end;
                    if (pos(letra,'<>=+-*/(){}[],^')<> 0) then
                       sFormulaP:=sFormulaP+letra;
                    letra:='';
                    spalavra:='';
                 end;
           end;
        end else begin
            sformulaP := sformula;
            Mudou := False;
        end;

        if Mudou then begin
           QryFormulas.Edit;
           QryFormulas.FieldbyName('EXPRESSAOREAL').AsString := sFormulaP;
           QryFormulas.Post;
        end;

        frmAguarde.Pos := frmAguarde.Pos + 1;

        QryFormulas.Next;
  end;

  QryFormulas.ApplyUpdates;
  QryFormulas.Close;
  frmAguarde.Apaga;
end;


function TfrmParamRegra.tiraTodosBrancos(Value: String): String;
var
  i: Integer;
begin
  i := pos(' ',Value);
  while i <> 0 do begin
        delete(Value,i,1);
        i := pos(' ',Value);
  end;
  Result := Value;
end;


Function TfrmParamRegra.TiraPlic(texto:string):string;
begin
    if texto[1]='''' then
       texto :=copy(texto,2,length(texto));
    if texto[length(texto)]='''' then
       texto:= copy(texto,1,length(texto)-1);
    result:=texto
end;


end.
