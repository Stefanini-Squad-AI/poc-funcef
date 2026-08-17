// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 04.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit FParamRelOcor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, Wwdbspin, checklst, Db,
  Wwdatsrc, DBTables, Wwtable, wwdblook, Wwquery;

type
  TfrmParamRelOcor = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    cbmes: TComboBox;
    GroupBox2: TGroupBox;
    dbseano: TwwDBSpinEdit;
    chklstOcor: TCheckListBox;
    bbtnTodas: TBitBtn;
    bbtnInverte: TBitBtn;
    grpUsuario: TGroupBox;
    dsUsuario: TwwDataSource;
    dblkpUsuario: TwwDBLookupCombo;
    qryUsuario: TwwQuery;
    procedure bbtnTodasClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    LstOcor :TStringList;
    I:Integer;
    wDia,wMes,wAno : Word;

  public
    { Public declarations }
  end;

implementation

uses UMensErro, UAdmPrev, DRelatAdmPrev2,DRelatAdmPrev, UDataBase;

{$R *.DFM}

procedure TfrmParamRelOcor.bbtnTodasClick(Sender: TObject);
var i : integer;
begin
  inherited;
  for i := 0 to ChkLstOcor.Items.Count - 1 do
      ChkLstOcor.checked[I]:= True;
end;

procedure TfrmParamRelOcor.bbtnInverteClick(Sender: TObject);
var i : integer;
begin
  inherited;
  for i := 0 to ChkLstOcor.Items.Count - 1 do
     ChkLstOcor.Checked[I] := Not ChkLstOcor.Checked[I];
end;

procedure TfrmParamRelOcor.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value   := wAno;
  LstOcor         := TStringList.Create;
  qryusuario.open;
end;

procedure TfrmParamRelOcor.bbtnConfirmarClick(Sender: TObject);
var   wMesAno, sTipoM   : string;
      bMostraRequeridos : boolean;
      sSQL, sSQL2       : string;
      i : integer;
begin
  inherited;
  sTipoM := '';

  if (cbMes.ItemIndex+1) <= 9 then
     wMesAno := Trim(dbseano.Text)+'/0'+IntToStr(cbMes.ItemIndex+1)
  else
     wMesAno := Trim(dbseano.Text)+'/'+IntToStr(cbMes.ItemIndex+1);

  bMostraRequeridos := False;

  For i := 0 To ChkLstOcor.Items.Count - 1 Do
  begin
    If (ChkLstOcor.Checked[I] = True)
    then if i <> 8
         then sTipoM := sTipoM + IntToStr(I) + ','
         else bMostraRequeridos := True;
  end;
  sTipoM := Trim(Copy(sTipoM,1,((Length(sTipoM)-1))));

  if  cbMes.ItemIndex = -1 then
  begin
      MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
      cbMes.SetFocus;
      ModalResult := mrNone;
      Exit;
  end
  else if dbseAno.Value = 0 then
  begin
      MsgDlg('Ano de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
      dbseAno.Value := wAno;
      dbseano.SetFocus;
      ModalResult := mrNone;
      Exit;
  end
  else if (sTipoM = '') and (not chklstOcor.Checked[8] )
  then begin
     MsgDlg('Selecione o Tipo de Ocorrência. ','Erro',mtError,[mbOk,mbHelp],0);
     ChkLstOcor.SetFocus;
     ModalResult := mrNone;
     Exit;
  end ;

  with dtmRelatAdmPrev2 do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;
  END;

  sSQL  := '';
  sSQL2 := '';

  with dtmRelatAdmPrev2 do
  begin
     if Trim(sTipoM) <> ''
     then begin
        sSql := ' SELECT  1 AS CONT, EL.MATRICULA, MOV.IDMOVBENEF, MOV.IDPLANOPREV, MOV.IDPESSJUR, MOV.IDTITULAR, MOV.IDBENEFICIO, '+
                ' 	      MOV.NUMEROPROCESSO, MOV.IDPESSOA, MOV.SEQPROPOSTA, MOV.DATAMOV, MOV.VALORATUAL, MOV.DATAINICIOANT, US.NOMEUSUARIO, '+
                ' 	      MOV.VALORTOTAL, MOV.VALORCOTAS, MOV.DATAINICIO, MOV.DATAFINAL, BEN.NOME AS BENEFICIO, MOV.TRGUSERINCLUSAO,'+
                '         PES.NOME AS PESSOAF, PLA.NOME AS PLANO, MOV.DATAFINALANT , MOV.VALORATUALANT ,'+
                '         TIT.NOME AS TITULAR, DECODE( MOV.TIPOMOV, 0, ''Renovação'', '+
                '                                                   1, ''Reabertura'', '+
                '                                                   2, ''Prorrogação'', '+
                '                                                   3, ''Retenção'',    '+
                '                                                   4, ''Encerramento'','+
                '                                                   5, ''Desdobramento'','+
                '                                                   6, ''Reajuste Judicial'', '+
                '                                                   7, ''Concessão'',          '+
                '                                                   8, ''Recalculo de Beneficio Provisorio'', '+
                '                                                   9, ''Registro de falecimento de beneficiario'') '+
                '                                                    AS  TIPOMOVIM, '+
                ''''+wMesAno+''' AS MESREFERENCIA '+
                ' FROM    PATRO PT, ELEGPATRO EL, MOVBENEF MOV, BENEFICIO BEN, PESSOA PES, PLANPREV PLA, PESSOA TIT , USUARIOSISTEMA US '+ 
                ' WHERE   (TO_CHAR(MOV.DATAMOV,''YYYY/MM'') = ''' + wMesAno + ''') '+
                ' AND     (MOV.TIPOMOV IN ('+sTipoM+')) ';

                If  dblkpUsuario.text <> ''
                Then sSql := sSql +
                       ' AND     (MOV.TRGUSERINCLUSAO  = '+QuotedStr('CM'+ qryUsuario.FieldByName('IDUSUARIO').AsString) +')';
                sSql := sSql +
                      ' AND     (MOV.IDBENEFICIO       = BEN.IDBENEFICIO)  '+
                      ' AND     (MOV.IDPESSOA 		    = PES.IDPESSOA)     '+
                      ' AND     (MOV.IDPLANOPREV 	    = PLA.IDPLANOPREV)  '+
                      ' AND     (MOV.IDTITULAR 		    = TIT.IDPESSOA)     '+
                      ' AND     (EL.IDPESSJUR          = MOV.IDPESSJUR)    '+
                      ' AND     (EL.IDPESSOA           = MOV.IDTITULAR)    '+
                      ' AND     (PT.IDPESSOA           = MOV.IDPESSJUR)    '+         
                      ' AND     (PT.IDFUNDACAO         = '+IntToStr(iIdFundacao)+')'+ 
                      ' AND     (SUBSTR(MOV.TRGUSERINCLUSAO,3,10) = TO_CHAR(US.IDUSUARIO) ) '+
                      ' GROUP BY EL.MATRICULA,MOV.IDMOVBENEF, MOV.IDPLANOPREV, MOV.IDPESSJUR, MOV.IDTITULAR, MOV.IDBENEFICIO,'+
                      ' 	MOV.NUMEROPROCESSO, MOV.IDPESSOA, MOV.SEQPROPOSTA, MOV.DATAMOV, MOV.VALORATUAL, US.NOMEUSUARIO,  '+
                      ' 	MOV.VALORTOTAL, MOV.VALORCOTAS, MOV.DATAINICIO, MOV.DATAFINAL, BEN.NOME, MOV.TRGUSERINCLUSAO, '+
                      '  PES.NOME,PLA.NOME, TIT.NOME,MOV.TIPOMOV, MOV.DATAINICIOANT, MOV.DATAFINALANT , MOV.VALORATUALANT ';
     end;

     if bMostraRequeridos
     then begin
        sSQL2 := ' SELECT  1 AS CONT, EL.MATRICULA, 99 AS IDMOVBENEF, BF.IDPLANOPREV, BF.IDPESSJUR, BF.IDTITULAR, BF.IDBENEFICIO, '+
        '         BF.NUMEROPROCESSO, BF.IDPESSOA, BF.SEQPROPOSTA, BF.TRGDTINCLUSAO AS DATAMOV,                                    '+
        '         TO_NUMBER(BF.VALORATUAL),                                                                                       '+
        '         TO_DATE(NULL) AS DATAINICIOANT, US.NOMEUSUARIO,                                                                 '+
        '         BF.VALORTOTAL, BF.VALORCOTAS, BF.DATAINICIO, BF.DATAFINAL, BEN.NOME AS BENEFICIO, BF.TRGUSERINCLUSAO,           '+
        '         PES.NOME AS PESSOAF, PLA.NOME AS PLANO, TO_DATE(NULL) AS DATAFINALANT , 0 AS VALORATUALANT ,                    '+
        '         TIT.NOME AS TITULAR, ''Requerimento'' AS  TIPOMOVIM,                                                            '+
        ''''+wMesAno+''' AS MESREFERENCIA                                                                                         '+
        ' FROM    PATRO PT, PESSOA PES, PESSOA TIT, ELEGPATRO EL, BENEFBFCIARIO BF, BENEFICIO BEN, PLANPREV PLA, USUARIOSISTEMA US          '+
        ' WHERE   (TO_CHAR(BF.TRGDTINCLUSAO,''YYYY/MM'') = ''' + wMesAno + ''')                                                   ';
        if  dblkpUsuario.text <> ''
        then sSql2 := sSql2 +' AND     (BF.TRGUSERINCLUSAO  = '+QuotedStr('CM'+ qryUsuario.FieldByName('IDUSUARIO').AsString) +')  ';
        sSql2 := sSql2 +' AND     (BF.IDBENEFICIO                      = BEN.IDBENEFICIO)                                          '+
        ' AND     (BF.IDPESSOA 		                = PES.IDPESSOA)                                                                 '+
        ' AND     (BF.IDPLANOPREV 	                = PLA.IDPLANOPREV)                                                              '+
        ' AND     (BF.IDTITULAR 		             = TIT.IDPESSOA)                                                                 '+
        ' AND     (EL.IDPESSJUR                    = BF.IDPESSJUR)                                                                 '+
        ' AND     (EL.IDPESSOA                     = BF.IDTITULAR)                                                                 '+
        ' AND     (PT.IDPESSOA           = BF.IDPESSJUR)    '+         
        ' AND     (PT.IDFUNDACAO         = '+IntToStr(iIdFundacao)+')'+
        ' AND     (SUBSTR(BF.TRGUSERINCLUSAO,3,10) = TO_CHAR(US.IDUSUARIO) )                                                       '+
        ' AND     ((BF.DATACONCESSAO IS NULL ) or (IDSITBENEFICIO = 4))                                                            '+
        ' GROUP BY EL.MATRICULA, BF.IDPLANOPREV, BF.IDPESSJUR, BF.IDTITULAR, BF.IDBENEFICIO,                                       '+
        ' 	      BF.NUMEROPROCESSO, BF.IDPESSOA, BF.SEQPROPOSTA, BF.TRGDTINCLUSAO, BF.VALORATUAL, US.NOMEUSUARIO,                  '+
        ' 	      BF.VALORTOTAL, BF.VALORCOTAS, BF.DATAINICIO, BF.DATAFINAL, BEN.NOME,  BF.TRGUSERINCLUSAO,                         '+
        '          PES.NOME,PLA.NOME, TIT.NOME                                                                                     ';
     end;

     if Trim(sSQL) <> ''
     then begin
        if Trim(sSQL2) <> '' then sSQL := sSQL + ' UNION '+sSQL2;
     end
     else begin // ssQL = ''
        if Trim(sSQL2) <> '' then sSQL := sSQL2;
     end;

     if Trim(sSQL) = '' then Exit;

     sSQL := sSQL + ' ORDER BY PLANO, TIPOMOVIM, PESSOAF ';
     Fazquery(dtmRelatAdmPrev2.qryMovBenefOcor,sSql);

  end;
end;

procedure TfrmParamRelOcor.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value   := wAno;
end;

procedure TfrmParamRelOcor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryUsuario.Close;
end;

end.





