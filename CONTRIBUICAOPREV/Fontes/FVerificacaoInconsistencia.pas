unit FVerificacaoInconsistencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, ComCtrls,uSistema;

type
  TfrmVerificacaoInconsistencia = class(TfrmSairAjuda)
    qryContXSitFund: TwwQuery;
    qryContXHist: TwwQuery;
    qryHistXDIB: TwwQuery;
    v: TPanel;
    Label1: TLabel;
    memResult: TMemo;
    Animate1: TAnimate;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    c: TBevel;
    Label2: TLabel;
    bbtnHistXDIB: TBitBtn;
    Bevel2: TBevel;
    bbtnContXHist: TBitBtn;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Bevel3: TBevel;
    bbtnInconsist06: TBitBtn;
    qry: TwwQuery;
    Label8: TLabel;
    bbtnAcertar: TBitBtn;
    qryEXEC: TwwQuery;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Bevel4: TBevel;
    Label10: TLabel;
    Bevel5: TBevel;
    bbtnTipoBenef: TBitBtn;
    BitBtn1: TBitBtn;
    qryVerifTipoBenef: TwwQuery;
    qryAcertoTipoBenef: TwwQuery;
    Bevel6: TBevel;
    Label11: TLabel;
    bbtnAcertaContribAssistido: TBitBtn;
    qryVerifica: TwwQuery;
    lblcontador: TLabel;
    Bevel7: TBevel;
    Label12: TLabel;
    bbtnAcertaContribAssistido2: TBitBtn;
    Bevel8: TBevel;
    Label13: TLabel;
    bbtnRenovados: TBitBtn;
    Label14: TLabel;
    Bevel9: TBevel;
    bbtnAcertaSaldoIniReserva: TBitBtn;

    procedure bbtnContXSitFundClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnContXHistClick(Sender: TObject);
    procedure bbtnHistXDIBClick(Sender: TObject);
    procedure bbtnInconsist06Click(Sender: TObject);
    procedure bbtnAcertarClick(Sender: TObject);
    procedure bbtnTipoBenefClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtnAcertaContribAssistidoClick(Sender: TObject);
    procedure bbtnAcertaContribAssistido2Click(Sender: TObject);
    procedure bbtnRenovadosClick(Sender: TObject);
    procedure bbtnAcertaSaldoIniReservaClick(Sender: TObject);


  private { Private declarations }


  public  { Public declarations }


  end;




var
  frmVerificacaoInconsistencia: TfrmVerificacaoInconsistencia;




implementation
{$R *.DFM}
uses 
  uDataBAse, UMensErro, UAdmPrev, DBaseDados;




procedure TfrmVerificacaoInconsistencia.bbtnContXSitFundClick(
  Sender: TObject);
Var
  sSQL, sLinha, sMatricula, sNome, sSituacao, sContribuicao :String;
  Ini:TTime;
  Contador : Integer;

  F : TextFile;

begin
  inherited;

  Label1.Caption := '';

  Label4.Visible  :=True;
  Label4.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;

  Contador:=0;
  Ini :=Time;

   sSQL :=
      ' SELECT EL.MATRICULA, P.NOME, SP.DESCRICAO AS SITUACAO,        ' +
      '        C.NOME AS CONTRIBUICAO                                 ' +
      ' FROM  PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP,                ' +
      '       SITPART SP, CONTRIBPREVPARTP CPP, CONTPREV CP,          ' +
      '       CONTRIBUICAO C                                          ' +
      ' WHERE PP.IDSITPART   = SP.IDSITPART                           ' +
      ' AND   SP.FLGINTERNO  <> CP.FLGINTERNO                         ' +
      ' AND   PP.IDPESSJUR   = EL.IDPESSJUR                           ' +
      ' AND   PP.IDPESSOA    = EL.IDPESSOA                            ' +
      ' AND   P.IDPESSOA     = EL.IDPESSOA                            ' +
      ' AND   CPP.IDPESSJUR  = PP.IDPESSJUR                           ' +
      ' AND   CPP.IDPLANOPREV = PP.IDPLANOPREV                        ' +
      ' AND   CPP.IDPESSOA = PP.IDPESSOA                              ' +
      ' AND   CPP.SEQPROPOSTA  = PP.SEQPROPOSTA                       ' +
      ' AND   CPP.IDPLANOPREV  = CP.IDPLANOPREV                       ' +
      ' AND   CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO                  ' +
      ' AND   CPP.FLGCOBRA = 1                                        ' +
      ' AND   CPP.IDCONTRIBUICAO = C.IDCONTRIBUICAO                   ' +
      ' ORDER BY  MATRICULA                                           ' ;

      With qryContXSitFund do begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Try
        Open;
        If Not IsEmpty Then Begin

          //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
          //Label1.Caption := 'C:\CMINCONSIST01.TXT ';
          Label1.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST01.TXT ';

          //AssignFile(F,'C:\CMINCONSIST01.TXT ');
          AssignFile(F, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST01.TXT ');
          Rewrite(F);

           memResult.Clear;
           memResult.Lines.Add('                          CONTRIBUIÇÃO  X  SITUAÇÃO NA FUNDAÇÃO                                                        ');
           memResult.Lines.Add('===========================================================================================================================================');
           memResult.Lines.Add(' MATRÍCULA              NOME                                       SITUAÇÃO                                             CONTRIBUIÇÃO');
           memResult.Lines.Add('===========================================================================================================================================');
          First;
           While Not EOF Do
            begin
               sMatricula    :=  qryContXSitFund.FieldByName('MATRICULA').AsString+
                             STRINGOFCHAR(' ',20-LENGTH(qryContXSitFund.FieldByName('MATRICULA').AsString));
               sNome         :=  qryContXSitFund.FieldByName('NOME').AsString+
                             STRINGOFCHAR(' ',40-LENGTH(qryContXSitFund.FieldByName('NOME').AsString));
               sSituacao     :=  qryContXSitFund.FieldByName('SITUACAO').AsString+
                             STRINGOFCHAR(' ',50-LENGTH(qryContXSitFund.FieldByName('SITUACAO').AsString));
               sContribuicao :=  qryContXSitFund.FieldByName('CONTRIBUICAO').AsString;
               sLinha        := ' '+ sMatricula + '   ' + sNome + '   '+ sSituacao + '   ' + sContribuicao;

               Writeln(F,sLinha);
               Next;
            end;
        End;
      Except
        on E:EDBEngineError do begin
          MostrarErro(E);
          Exit;
        end;
      End;
   End;

   CloseFile(F);

  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  //Label1.Caption :=  'C:\CMINCONSIST01.TXT ';
  Label1.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST01.TXT ';

  Label4.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;


  Application.ProcessMessages;
  MsgDlg(


   'Inicio.:   '+TimeToStr(Ini) +#13+
   'Final .:   '+TimeToStr(Time)+#13+
   '             ---------------'+#13+
   'Tempo .: '+TimeToStr(Time-Ini),
   'Processamento OK',MtInformation,[MbOk],0);
End;



procedure TfrmVerificacaoInconsistencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryContXSitFund.Close;
  qryContXHist.Close;
  qryHistXDIB.Close;

  inherited;
end;



procedure TfrmVerificacaoInconsistencia.bbtnContXHistClick(Sender: TObject);
Var
  sSQL,  sLinha, sMatricula, sNome, sContribuicao, sUltMesPreparo, sMesHistorico:String;
  Ini:TTime;
  Contador : Integer;

  F : TextFile;
begin
 inherited;

 Label1.Caption := '';

  Label4.Visible  :=True;
  Label4.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;

  Contador:=0;
  Ini :=Time;

   sSQL :=
      ' SELECT EL.MATRICULA, P.NOME, C.NOME AS CONTRIBUICAO,          ' +
      '        CPP.ULTMESPREPARO, HST.MESCOBRANCA AS MESHISTORICO     ' +
      ' FROM  PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP,                ' +
      '       CONTRIBPREVPARTP CPP, HSTCONTRIBPREV HST,               ' +
      '       CONTRIBUICAO C                                          ' +
      ' WHERE PP.IDPESSJUR       = EL.IDPESSJUR                       ' +
      ' AND   PP.IDPESSOA        = EL.IDPESSOA                        ' +
      ' AND   P.IDPESSOA         = EL.IDPESSOA                        ' +
      ' AND   CPP.IDPESSJUR      = PP.IDPESSJUR                       ' +
      ' AND   CPP.IDPLANOPREV    = PP.IDPLANOPREV                     ' +
      ' AND   CPP.IDPESSOA       = PP.IDPESSOA                        ' +
      ' AND   CPP.SEQPROPOSTA    = PP.SEQPROPOSTA                     ' +
      ' AND   CPP.FLGCOBRA       = 1                                  ' +
      ' AND   CPP.IDCONTRIBUICAO = C.IDCONTRIBUICAO                   ' +
      ' AND   HST.IDPESSJUR      = CPP.IDPESSJUR                      ' +
      ' AND   HST.IDPLANOPREV    = CPP.IDPLANOPREV                    ' +
      ' AND   HST.IDPESSOA       = CPP.IDPESSOA                       ' +
      ' AND   HST.SEQPROPOSTA    = CPP.SEQPROPOSTA                    ' +
      ' AND   HST.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO                 ' +
      ' AND   HST.MESCOBRANCA    > CPP.ULTMESPREPARO                  ' +
      ' ORDER BY  MATRICULA                                           ' ;


      With qryContXHist do begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Try
        Open;
        If Not IsEmpty Then Begin

          //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
          //Label1.Caption := 'C:\CMINCONSIST02.TXT ';
          Label1.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST02.TXT ';
          //AssignFile(F,'C:\CMINCONSIST02.TXT ');
          AssignFile(F, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST02.TXT ');

          Rewrite(F);
        
           memResult.Clear;
           memResult.Lines.Add('                                 CONTRIBUIÇÃO  X  HISTÓRICO                                                                       ');
           memResult.Lines.Add('===============================================================================================================================================================================');
           memResult.Lines.Add(' MATRÍCULA        NOME                                                         CONTRIBUIÇÃO                                  Último Mês Preparo                   Mês Histórico');
           memResult.Lines.Add('===============================================================================================================================================================================');
          First;
           While Not EOF Do
            begin
               sMatricula     :=  qryContXHist.FieldByName('MATRICULA').AsString+
                               STRINGOFCHAR(' ',20-LENGTH(qryContXHist.FieldByName('MATRICULA').AsString));
               sNome          :=  qryContXHist.FieldByName('NOME').AsString+
                              STRINGOFCHAR(' ',40-LENGTH(qryContXHist.FieldByName('NOME').AsString));
               sContribuicao  :=  qryContXHist.FieldByName('CONTRIBUICAO').AsString+
                              STRINGOFCHAR(' ',40-LENGTH(qryContXHist.FieldByName('CONTRIBUICAO').AsString));
               sUltMesPreparo :=  qryContXHist.FieldByName('ULTMESPREPARO').AsString+
                              STRINGOFCHAR(' ',20-LENGTH(qryContXHist.FieldByName('ULTMESPREPARO').AsString));
               sMesHistorico  :=  qryContXHist.FieldByName('MESHISTORICO').AsString;
               sLinha         := ' '+ sMatricula + '   ' + sNome + '               '+ sContribuicao + '             ' + sUltMesPreparo +'    ' + sMesHistorico;

               writeln(F,sLinha);  
               Next;
            end;
        End;
      Except
        on E:EDBEngineError do begin
          MostrarErro(E);
          Exit;
        end;
      End;

   End;

   CloseFile(F);
   
    //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
    //Label1.Caption :=  'C:\CMINCONSIST02.TXT ';
    Label1.Caption :=  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST02.TXT ';

  Label4.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;


  Application.ProcessMessages;
  MsgDlg(


   'Inicio.:   '+TimeToStr(Ini) +#13+
   'Final .:   '+TimeToStr(Time)+#13+
   '             ---------------'+#13+
   'Tempo .: '+TimeToStr(Time-Ini),
   'Processamento OK',MtInformation,[MbOk],0);
End;



procedure TfrmVerificacaoInconsistencia.bbtnHistXDIBClick(Sender: TObject);
Var
  sSQL,  sLinha, sMatricula, sNome, sContribuicao, sMesHistorico, sDataInicioFund:String;
  Ini:TTime;
  Contador : Integer;

  F : TextFile;  
begin
  inherited;

  Label1.Caption := '';

  Label4.Visible  :=True;
  Label4.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;

  Contador:=0;
  Ini :=Time;

   sSQL :=
      ' SELECT EL.MATRICULA, P.NOME, C.NOME AS CONTRIBUICAO,                      ' +
      '        HST.MESCOBRANCA AS MESHISTORICO, BF.DATAINICIOFUND                 ' +
      ' FROM  PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP,                            ' +
      '       CONTPREV CP, BENEFBFCIARIO BF, HSTCONTRIBPREV HST,                  ' +
      '       CONTRIBUICAO C, BENEFICIO B                                         ' +
      ' WHERE PP.IDPESSJUR       = EL.IDPESSJUR                                   ' +
      ' AND   PP.IDPESSOA        = EL.IDPESSOA                                    ' +
      ' AND   P.IDPESSOA         = EL.IDPESSOA                                    ' +
      ' AND   HST.IDPLANOPREV    = CP.IDPLANOPREV                                 ' +
      ' AND   HST.IDCONTRIBUICAO = CP.IDCONTRIBUICAO                              ' +
      ' AND   HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO                               ' +
      ' AND   HST.IDPESSJUR      = PP.IDPESSJUR                                   ' +
      ' AND   HST.IDPLANOPREV    = PP.IDPLANOPREV                                 ' +
      ' AND   HST.IDPESSOA       = PP.IDPESSOA                                    ' +
      ' AND   HST.SEQPROPOSTA    = PP.SEQPROPOSTA                                 ' +
      ' AND   BF.IDPESSJUR       = PP.IDPESSJUR                                   ' +
      ' AND   BF.IDPLANOPREV     = PP.IDPLANOPREV                                 ' +
      ' AND   BF.IDTITULAR       = PP.IDPESSOA                                    ' +
      ' AND   BF.SEQPROPOSTA     = PP.SEQPROPOSTA                                 ' +
      ' AND   BF.IDBENEFICIO     = B.IDBENEFICIO                                  ' +
      ' AND   B.FLGBENEFTEMP     = 0                                              ' +
      ' AND   CP.FLGINTERNO      <> ''AS''                                        ' +
      ' AND   SUBSTR(HST.MESREFERENCIA,6,2) <> ''13''                             ' +
      ' AND ( ((CP.FLGINTERNO <> '+QuotedStr('AS')+' )    AND                                  ' +
      '        (HST.MESCOBRANCA > TO_CHAR(BF.DATAINICIOFUND,''YYYY/MM'')) AND ' +
      '        (HST.FLGDEVOLUCAO = 0 )  )  OR                                     ' +
      '       ((CP.FLGINTERNO = '+QuotedStr('AS')+')      AND                                  ' +
      '        (HST.MESCOBRANCA < TO_CHAR(BF.DATAINICIOFUND,''YYYY/MM'')) AND ' +
      '        (HST.FLGDEVOLUCAO = 0 )  ) )                                       ' +
       ' ORDER BY  EL.MATRICULA                                                      ' ;


      With qryHistXDIB do begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Try
        Open;
        If Not IsEmpty Then Begin

          //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
          //Label1.Caption := 'C:\CMINCONSIST03.TXT ';
          Label1.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST03.TXT ';
          //AssignFile(F,'C:\CMINCONSIST03.TXT ');
          AssignFile(F, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST03.TXT ');

          Rewrite(F);

          writeln(F, '                                   HISTÓRICO  X  DIB                                                                     ');
          writeln(F, '=================================================================================================================================');
          writeln(F, ' MATRÍCULA      NOME                                    CONTRIBUIÇÃO                   Mês Hist.  Data Início Fundação ');
          writeln(F, '=================================================================================================================================');

          First;
           While Not EOF Do
            begin
               sMatricula      :=  qryHistXDIB.FieldByName('MATRICULA').AsString+
                               STRINGOFCHAR(' ',15-LENGTH(qryHistXDIB.FieldByName('MATRICULA').AsString));
               sNome           :=  qryHistXDIB.FieldByName('NOME').AsString+
                               STRINGOFCHAR(' ',40-LENGTH(qryHistXDIB.FieldByName('NOME').AsString));
               sContribuicao   :=  qryHistXDIB.FieldByName('CONTRIBUICAO').AsString+
                               STRINGOFCHAR(' ',30-LENGTH(qryHistXDIB.FieldByName('CONTRIBUICAO').AsString));
               sMesHistorico   :=  qryHistXDIB.FieldByName('MESHISTORICO').AsString+
                               STRINGOFCHAR(' ',8-LENGTH(qryHistXDIB.FieldByName('MESHISTORICO').AsString));
               sDataInicioFund := qryHistXDIB.FieldByName('DATAINICIOFUND').AsString;
               sLinha          := ' '+ sMatricula + ' ' + sNome + ' '+ sContribuicao + ' ' +  sMesHistorico +' ' +sDataInicioFund ;

               writeln(F, sLinha);
               Next;
            end;

          writeln(F, '=================================================================================================================================');

        End;
      Except
        on E:EDBEngineError do begin
          MostrarErro(E);
          Exit;
        end;
      End;
   End;

   CloseFile(F);

   //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
   //Label1.Caption :=  'C:\CMINCONSIST03.TXT ';
   Label1.Caption :=  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST03.TXT ';

  Label4.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;

  Application.ProcessMessages;
  MsgDlg(

   'Inicio.:   '+TimeToStr(Ini) +#13+
   'Final .:   '+TimeToStr(Time)+#13+
   '             ---------------'+#13+
   'Tempo .: '+TimeToStr(Time-Ini),
   'Processamento OK',MtInformation,[MbOk],0);
end;



procedure TfrmVerificacaoInconsistencia.bbtnInconsist06Click(Sender: TObject);
var
  sSQL, sLinha, sMatricula, sNome, sBeneficio : string;
  Ini:TTime;
  Contador : Integer;
  F : TextFile;

begin
  inherited;

  Label4.Visible  :=True;
  Label4.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;

  Contador:=0;
  Ini :=Time;


  sSQL := ' SELECT EL.MATRICULA, P.NOME, COUNT(DISTINCT BF.NUMEROPROCESSO) AS NUMBENEF '+
          ' FROM   PESSOA P, ELEGPATRO EL,                        '+
          '        BENEFBFCIARIO BF                               '+
          ' WHERE  BF.IDPESSJUR      = EL.IDPESSJUR               '+
          ' AND    BF.IDPESSOA       = EL.IDPESSOA                '+
          ' AND    BF.IDSITBENEFICIO = 1                          '+
          ' AND    EL.IDPESSOA        = P.IDPESSOA                '+
          ' GROUP BY EL.MATRICULA, P.NOME                         '+
          ' ORDER BY COUNT(DISTINCT BF.NUMEROPROCESSO), EL.MATRICULA       ';


  with qry do
  begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Try
        Open;
      except
         MsgDlg('Erro ao abrir query.','Erro',mtError,[mbOk, mbHelp],0);
         Exit;
      end;

      if IsEmpty
      then begin
         MsgDlg('Nenhum registro encontrado.','Informação',mtInformation,[mbOk, mbHelp],0);
         Label4.Visible  :=False;
         Animate1.Visible:=False;
         Animate1.Active :=False;
      end;

      //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
      //Label1.Caption := 'C:\CMINCONSIST06.TXT ';
      Label1.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST06.TXT ';
      //AssignFile(F,'C:\CMINCONSIST06.TXT ');
      AssignFile(F, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST06.TXT ');

      Rewrite(F);

        Writeln(F,'                    PARTICIPANTES COM MAIS DE UM BENEFICIO ATIVO       ');
        Writeln(F,'=============================================================================');
        Writeln(F,' MATRÍCULA          NOME                                     NUM. BENEFICIOS ');
        Writeln(F,'=============================================================================');

      First;
      while not EOF do
      begin
         if qry.FieldByName('NumBenef').AsInteger <= 1
         then begin
            Next;
            continue;
         end;

         sMatricula    :=  qry.FieldByName('MATRICULA').AsString+
                       STRINGOFCHAR(' ',20-LENGTH(qry.FieldByName('MATRICULA').AsString));
         sNome         :=  qry.FieldByName('NOME').AsString+
                       STRINGOFCHAR(' ',40-LENGTH(qry.FieldByName('NOME').AsString));
         sBeneficio    :=  qry.FieldByName('NUMBENEF').AsString+
                       STRINGOFCHAR(' ',50-LENGTH(qry.FieldByName('NUMBENEF').AsString));
         sLinha        := ' '+ sMatricula + '   ' + sNome + '   '+ SBeneficio ;

         Writeln(F,sLinha);
         Next;
      end;

      CloseFile(F);
  end;

  Label4.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;

  Application.ProcessMessages;
  MsgDlg( 'Inicio.:   '+TimeToStr(Ini) +#13+
          'Final .:   '+TimeToStr(Time)+#13+
          '             ---------------'+#13+
          'Tempo .: '+TimeToStr(Time-Ini),
          'Processamento OK',MtInformation,[MbOk],0);
end;



procedure TfrmVerificacaoInconsistencia.bbtnAcertarClick(Sender: TObject);
var
  sSQL  : string;
begin
  inherited;

  Label4.Visible  :=True;
  Label4.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;


  sSQL := ' SELECT EL.IDPESSJUR, EL.IDPESSOA, EL.MATRICULA, P.NOME, COUNT(DISTINCT BF.NUMEROPROCESSO) AS NUMBENEF, '+
          '        MAX(BF.DATAINICIOFUND) AS MAIORDATA            '+
          ' FROM   PESSOA P, ELEGPATRO EL,                        '+
          '        BENEFBFCIARIO BF                               '+
          ' WHERE  BF.IDPESSJUR      = EL.IDPESSJUR               '+
          ' AND    BF.IDPESSOA       = EL.IDPESSOA                '+
          ' AND    BF.IDSITBENEFICIO = 1                          '+
          ' AND    EL.IDPESSOA        = P.IDPESSOA                '+
          ' GROUP BY EL.IDPESSJUR, EL.IDPESSOA, EL.MATRICULA, P.NOME             '+
          ' ORDER BY COUNT(DISTINCT BF.NUMEROPROCESSO), EL.MATRICULA       ';


  with qry do
  begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Try
        Open;
      except
         MsgDlg('Erro ao abrir query.','Erro',mtError,[mbOk, mbHelp],0);
         Exit;
      end;

      if IsEmpty
      then begin
         MsgDlg('Nenhum registro encontrado.','Informação',mtInformation,[mbOk, mbHelp],0);
         Label4.Visible  :=False;
         Animate1.Visible:=False;
         Animate1.Active :=False;
      end;

      dtmBaseDados.dbBaseDados.StartTransaction;

      First;
      while not EOF do
      begin
         if qry.FieldByName('NumBenef').AsInteger <= 1
         then begin
            Next;
            continue;
         end;

         with qryExec do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO = 3 '+
                    ' WHERE  IDPESSJUR      = '+IntToStr(qry.FieldByName('IdPessJur').AsInteger) +
                    ' AND    IDTITULAR      = '+IntToStr(qry.FieldByName('IdPessoa').AsInteger)  +
                    ' AND    IDSITBENEFICIO = 1 '+
                    ' AND    DATAINICIOFUND < TO_DATE('''+qry.FieldByName('MaiorData').AsString+''', ''dd/mm/yyyy'') ');
            try
               ExecSQL;
            except
               dtmBaseDados.dbBaseDados.Rollback;
               exit;
            end;
         end;
         Next;
      end;

      dtmBaseDados.dbBaseDados.Commit;
  end;

  Label4.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;

  Application.ProcessMessages;
  MsgDlg('Processamento OK','Informaçào',mtInformation,[MbOk],0);
end;



procedure TfrmVerificacaoInconsistencia.bbtnTipoBenefClick(
  Sender: TObject);
Var
  sSQL,  sLinha, sMatricula, sNome, sBeneficio, sSituacao, sDataInicioFund : String;
  Ini:TTime;
  Contador : Integer;
  F : TextFile;

begin
  inherited;

  Label1.Caption := '';

  Label4.Visible  :=True;
  Label4.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;

  Contador:=0;
  Ini :=Time;

   sSQL :=
      ' SELECT EL.MATRICULA, P.NOME, B.NOME AS BENEFICIO,                           ' +
      '        SP.DESCRICAO AS SITUACAO, BF.DATAINICIOFUND                          ' +
      ' FROM  PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP,                              ' +
      '       SITPART SP, BENEFBFCIARIO BF,  BENEFICIO B                            ' +
      ' WHERE PP.IDPESSJUR       = EL.IDPESSJUR                                     ' +
      ' AND   PP.IDPESSOA        = EL.IDPESSOA                                      ' +
      ' AND   PP.IDSITPART       = SP.IDSITPART                                     ' +
      ' AND   P.IDPESSOA         = EL.IDPESSOA                                      ' +
      ' AND   BF.IDPESSJUR       = PP.IDPESSJUR                                     ' +
      ' AND   BF.IDPLANOPREV    = PP.IDPLANOPREV                                    ' +
      ' AND   BF.IDTITULAR      = PP.IDPESSOA                                       ' +
      ' AND   BF.SEQPROPOSTA    = PP.SEQPROPOSTA                                    ' +
      ' AND   BF.IDBENEFICIO     = B.IDBENEFICIO                                    ' +
      ' AND   BF.IDSITBENEFICIO = 1                                                 ' +
      ' AND ( ( (  BF.IDBENEFICIO = 26)   AND (PP.IDSITPART <> 3)   ) OR            ' +
      '       ( (  BF.IDBENEFICIO = 28)   AND (PP.IDSITPART <> 3)   ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 5)   AND (PP.IDSITPART <> 14)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 139) AND (PP.IDSITPART <> 14)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 138) AND (PP.IDSITPART <> 14)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 4)   AND (PP.IDSITPART <> 14)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 34)  AND (PP.IDSITPART <> 12)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 33)  AND (PP.IDSITPART <> 13)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 29)  AND (PP.IDSITPART <> 4)   ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 31)  AND (PP.IDSITPART <> 4)   ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 9)   AND (PP.IDSITPART <> 15)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 8)   AND (PP.IDSITPART <> 15)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 37)  AND (PP.IDSITPART <> 16)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 38)  AND (PP.IDSITPART <> 16)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 41)  AND (PP.IDSITPART <> 17)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 136) AND (PP.IDSITPART <> 24)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 135) AND (PP.IDSITPART <> 24)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 17)  AND (PP.IDSITPART <> 24)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 12)  AND (PP.IDSITPART <> 18)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 11)  AND (PP.IDSITPART <> 18)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 40)  AND (PP.IDSITPART <> 19)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 14)  AND (PP.IDSITPART <> 19)  ) OR            ' +
      '        ( (  BF.IDBENEFICIO = 15)  AND (PP.IDSITPART <> 19)  )   )           ' +
      '        ORDER BY  MATRICULA                                                  ' ;


      With qryVerifTipoBenef do begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Try
        Open;
        If Not IsEmpty Then Begin

          //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
          //Label1.Caption := 'C:\CMINCONSIST04.TXT ';
          Label1.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST04.TXT ';
          //AssignFile(F,'C:\CMINCONSIST04.TXT ');
          AssignFile(F,Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST04.TXT ');

          Rewrite(F);

          writeln(F, '                                VERIFICAR  SITUACAO DO PARTICIPANTE                                                                    ');
          writeln(F, '=================================================================================================================================');
          writeln(F, ' MATRÍCULA        NOME                                 BENEFICIO                     SITUACAO               Data Início Fundação ');
          writeln(F, '=================================================================================================================================');
          First;
           While Not EOF Do
            begin
               sMatricula      :=  qryVerifTipoBenef.FieldByName('MATRICULA').AsString+
                               STRINGOFCHAR(' ',20-LENGTH(qryVerifTipoBenef.FieldByName('MATRICULA').AsString));
               sNome           :=  qryVerifTipoBenef.FieldByName('NOME').AsString+
                               STRINGOFCHAR(' ',40-LENGTH(qryVerifTipoBenef.FieldByName('NOME').AsString));
               sBeneficio   :=  qryVerifTipoBenef.FieldByName('BENEFICIO').AsString+
                               STRINGOFCHAR(' ',40-LENGTH(qryVerifTipoBenef.FieldByName('BENEFICIO').AsString));
               sSituacao   :=  qryVerifTipoBenef.FieldByName('SITUACAO').AsString+
                               STRINGOFCHAR(' ',10-LENGTH(qryVerifTipoBenef.FieldByName('SITUACAO').AsString));
               sDataInicioFund := qryVerifTipoBenef.FieldByName('DATAINICIOFUND').AsString;
               sLinha          := ' '+ sMatricula + '   ' + sNome + '               '+ sBeneficio + '           ' +  sSituacao +'          ' +sDataInicioFund ;
               writeln(F,slinha);

               Next;
            end;
        End;
      Except
        on E:EDBEngineError do begin
          MostrarErro(E);
          Exit;
        end;
      End;
   End;
   writeln(F, '=================================================================================================================================');

   CloseFile(F);

    //Label1.Caption :=  'C:\CMINCONSIST04.TXT ';
    Label1.Caption :=  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMINCONSIST04.TXT ';

  Label4.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;

  Application.ProcessMessages;
  MsgDlg(
   'Inicio.:   '+TimeToStr(Ini) +#13+
   'Final .:   '+TimeToStr(Time)+#13+
   '             ---------------'+#13+
   'Tempo .: '+TimeToStr(Time-Ini),
   'Processamento OK',MtInformation,[MbOk],0);
end;



procedure TfrmVerificacaoInconsistencia.BitBtn1Click(Sender: TObject);
Var
  sSQL : String;
  Ini  :TTime;
  Contador : Integer;
begin
  inherited;

 Label1.Caption := '';

  Label4.Visible  :=True;
  Label4.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;

  Contador:=0;
  Ini :=Time;

  // Inicia Transacao
  dtmBaseDados.dbBaseDados.StartTransaction ;


  With qryAcertoTipoBenef Do Begin

  //  IDBENEFICIO = 26   IDSITPART = 3
     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 3            ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 26 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 28   IDSITPART = 3

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 3            ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 28 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 5   IDSITPART = 14

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 14           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 5  ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 139   IDSITPART = 14

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 14             ' +
             'WHERE IDPESSOA IN                                  ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO                ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 139  ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 138   IDSITPART = 14

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 14             ' +
             'WHERE IDPESSOA IN                                  ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO                ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 138  ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 4   IDSITPART = 14

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 14           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 4  ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 34   IDSITPART = 12

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 12           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 34 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 33   IDSITPART = 13

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 13           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 33 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 29   IDSITPART = 4

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 4            ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 29 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 31   IDSITPART = 4

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 4            ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 31 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 9   IDSITPART = 15

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 15           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 9  ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 8   IDSITPART = 15

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 15           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 8  ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 37   IDSITPART = 16

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 16           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 37 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 38   IDSITPART = 16

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 16           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 38 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 41   IDSITPART = 17

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 17           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 41 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 136   IDSITPART = 24

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 24            ' +
             'WHERE IDPESSOA IN                                 ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO               ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 136 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


   //  IDBENEFICIO = 135   IDSITPART = 24

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 24            ' +
             'WHERE IDPESSOA IN                                 ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO               ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 135 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 17   IDSITPART = 24

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 24           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 17 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


   //  IDBENEFICIO = 12   IDSITPART = 18

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 18           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 12 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 11   IDSITPART = 18

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 18           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 11 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


  //  IDBENEFICIO = 40   IDSITPART = 19

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 19           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 40 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


   //  IDBENEFICIO = 14   IDSITPART = 19

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 19           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 14 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;


   //  IDBENEFICIO = 15   IDSITPART = 19

     Close;
     SQL.Clear;
     SQL.ADD('UPDATE PARTPREVPLAN SET IDSITPART = 19           ' +
             'WHERE IDPESSOA IN                                ' +
             '(SELECT IDPESSOA FROM BENEFBFCIARIO              ' +
             ' WHERE  (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND IDBENEFICIO = 15 ) ' );

      Try
         ExecSQL;
      Except
        MsgDlg('Erro ao Atualizar Situacao.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.rollBack;
      End;

    End;

    // Valida Transacao
    IF MSGDLG('DESEJA CONFIRMAR ? ','CONFIRMAÇÃO', MTCONFIRMATION,[MBYES, MBNO],0) = mrYes
    then dtmBaseDados.dbBaseDados.Commit
    else dtmBaseDados.dbBaseDados.RollBack;

  Label4.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;


  Application.ProcessMessages;
  MsgDlg(
   'Inicio.:   '+TimeToStr(Ini) +#13+
   'Final .:   '+TimeToStr(Time)+#13+
   '             ---------------'+#13+
   'Tempo .: '+TimeToStr(Time-Ini),
   'Processamento OK',MtInformation,[MbOk],0);
end;



procedure TfrmVerificacaoInconsistencia.bbtnAcertaContribAssistidoClick(
  Sender: TObject);
var icont : longint;
begin
  inherited;
  // Verificar participantes que nao tem o beneficio abono e tem a contribuicao de assistido
  dtmBaseDados.dbBaseDados.StartTransaction;
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDPESSJUR, IDPLANOPREV, IDPESSOA AS IDTITULAR, IDPESSOA, SEQPROPOSTA, IDCONTRIBUICAO '+
             ' FROM   CONTRIBPREVPARTP                              '+
             ' WHERE  IDCONTRIBUICAO = 180 '+
             ' AND    FLGCOBRA       = 1   ');
     Open;
     icont := 0;
     while not Eof do
     begin
        qryVerifica.Close;
        qryVerifica.SQL.Clear;
        qryVerifica.SQL.Add(' SELECT NUMEROPROCESSO , IDSITBENEFICIO FROM BENEFBFCIARIO '+
                            ' WHERE  IDTITULAR    = '+FieldByName('IDTITULAR').AsString+
                            ' AND    IDPESSOA     = '+FieldByName('IDPESSOA').AsString+
                            ' AND    IDPESSJUR    = '+FieldByName('IDPESSJUR').AsString+
                            ' AND    IDPLANOPREV  = '+FieldByName('IDPLANOPREV').AsString+
                            ' AND    SEQPROPOSTA  = '+FieldByName('SEQPROPOSTA').AsString+
                            ' AND    ((IDBENEFICIO = 46) OR (IDBENEFICIO = 48) OR '+
                            '         (IDBENEFICIO = 50) OR (IDBENEFICIO = 51) OR '+
                            '         (IDBENEFICIO = 52) OR (IDBENEFICIO = 53) )  ');
        qryVerifica.Open;
        if qryVerifica.IsEmpty
        then begin // participante nao tem abono -> Apagar da contribprevpartp

           qryEXEC.Close;
           qryEXEC.SQL.Clear;
            qryEXEC.SQL.Add(' DELETE FROM TMPDESC  '+
                           ' WHERE  IDPESSJUR    = '+FieldByName('IDPESSJUR').AsString+
                           ' AND    IDPLANOPREV  = '+FieldByName('IDPLANOPREV').AsString+
                           ' AND    IDPESSOA     = '+FieldByName('IDPESSOA').AsString+
                           ' AND    SEQPROPOSTA  = '+FieldByName('SEQPROPOSTA').AsString+
                           ' AND    IDDESCONTO   = '+FieldByName('IDCONTRIBUICAO').AsString);

           try
              qryEXEC.ExecSQL;
           except
              dtmBaseDados.dbBaseDados.RollBack;
              Exit;
           end;

        end
        else begin
           if (qryVerifica.FieldByName('IdSitBeneficio').AsInteger = 2) or
              (qryVerifica.FieldByName('IdSitBeneficio').AsInteger = 3)
           then begin // beneficio retido ou encerrado -> colocar flgcobra = 0
           end;

        end;
        inc(icont);
        lblcontador.caption := IntTostr(icont)+' registros processados.';
        Application.processmessages;
        Next;
     end; // while
     dtmBaseDados.dbBaseDados.Commit;
  end;
end;



procedure TfrmVerificacaoInconsistencia.bbtnAcertaContribAssistido2Click(Sender: TObject);
var icont : longint;
begin
  inherited;

  // Verificar participantes TEM o beneficio abono e NAO tem a contribuicao de assistido
  dtmBaseDados.dbBaseDados.StartTransaction;
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDPESSJUR, IDPESSOA, IDPLANOPREV, SEQPROPOSTA , DATAINICIO, ULTMESPREPARO '+
             ' FROM BENEFBFCIARIO '+
             ' WHERE  ((IDBENEFICIO = 46) OR (IDBENEFICIO = 48) OR '+
             '         (IDBENEFICIO = 50) OR (IDBENEFICIO = 51) OR '+
             '         (IDBENEFICIO = 52) OR (IDBENEFICIO = 53) )  '+
             ' AND    (IDSITBENEFICIO = 1) ');
     Open;
     icont := 0;
     while not Eof do
     begin
        qryVerifica.Close;
        qryVerifica.SQL.Clear;
        qryVerifica.SQL.Add(' SELECT IDPESSJUR, IDPLANOPREV, IDPESSOA AS IDTITULAR, '+
                            '        FLGCOBRA, IDPESSOA, SEQPROPOSTA, IDCONTRIBUICAO '+
                            ' FROM   CONTRIBPREVPARTP                              '+
                            ' WHERE  IDPESSJUR    = '+FieldByName('IDPESSJUR').AsString+
                            ' AND    IDPLANOPREV  = '+FieldByName('IDPLANOPREV').AsString+
                            ' AND    IDPESSOA     = '+FieldByName('IDPESSOA').AsString+
                            ' AND    SEQPROPOSTA  = '+FieldByName('SEQPROPOSTA').AsString+
                            ' AND    IDCONTRIBUICAO = 180 ');

        qryVerifica.Open;
        if qryVerifica.IsEmpty
        then begin // participante nao tem contribuicao associada
           qryEXEC.Close;
           qryEXEC.SQL.Clear;
           qryEXEC.SQL.Add(' INSERT INTO CONTRIBPREVPARTP ( DATAINICIO,DIAVENCIMENTO, '+
                           '        FLGCOBRA,FLGDESCFOLHA,IDCONTRIBUICAO,IDPESSJUR,IDPESSOA,     '+
                           '        IDPLANOPREV,IDTPPERIODICIDADE,SEQPROPOSTA,ULTMESPREPARO )   '+
                           ' VALUES ( TO_DATE('''+FieldByName('DATAINICIO').AsString+''', ''DD/MM/YYYY'') , '+
                           '          0, 1, 1, 180, '+
                           FieldByName('IDPESSJUR').AsString+', '+
                           FieldByName('IDPESSOA').AsString+', '+
                           FieldByName('IDPLANOPREV').AsString+', '+
                           '1, 1, '''+FieldByName('ULTMESPREPARO').AsString+''')' );
           try
              qryEXEC.ExecSQL;
           except
              dtmBaseDados.dbBaseDados.RollBack;
              Exit;
           end;
        end
        else begin
           if (qryVerifica.FieldByName('FlgCobra').AsInteger = 0)
           then begin // contribuicao esta associada mas com flgcobra = 0
              qryEXEC.Close;
              qryEXEC.SQL.Clear;
              qryEXEC.SQL.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1 '+
                              ' WHERE  IDPESSJUR    = '+FieldByName('IDPESSJUR').AsString+
                              ' AND    IDPLANOPREV  = '+FieldByName('IDPLANOPREV').AsString+
                              ' AND    IDPESSOA     = '+FieldByName('IDPESSOA').AsString+
                              ' AND    SEQPROPOSTA  = '+FieldByName('SEQPROPOSTA').AsString+
                              ' AND    IDCONTRIBUICAO = 180 ');
              try
                 qryEXEC.ExecSQL;
              except
                 dtmBaseDados.dbBaseDados.RollBack;
                 Exit;
              end;
           end;
        end;
        inc(icont);
        lblcontador.caption := IntTostr(icont)+' registros processados.';
        Application.processmessages;
        Next;
     end; // while
     dtmBaseDados.dbBaseDados.Commit;
  end;
end;



procedure TfrmVerificacaoInconsistencia.bbtnRenovadosClick(
  Sender: TObject);
var iCont : longint;
    sData : string;
begin
  inherited;

  dtmBaseDados.dbBaseDados.StartTransaction;

  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,PF.DATANASC          '+
             ' FROM   PESSOAFISICA PF , PARTPREVPLAN PP '+
             ' WHERE  PP.IDPESSJUR   = 4                '+
             ' AND    PP.IDPLANOPREV = 3                '+
             ' AND    PF.IDPESSOA = PP.IDPESSOA         ');
     Open;
     icont := 0;
     while not Eof do
     begin
        sData := Copy(FieldByName('DATANASC').AsString,1,6)+IntToStr(StrToInt(Copy(FieldByName('DATANASC').AsString,7,4))+55);
        qryEXEC.Close;
        qryEXEC.SQL.Clear;
        qryEXEC.SQL.Add(' UPDATE CONTRIBPREVPARTP SET DATAFINAL = TO_DATE('''+sData+''', ''DD/MM/YYYY'') '+
                        ' WHERE  IDPESSJUR      = '+FieldByName('IDPESSJUR').AsString+
                        ' AND    IDPLANOPREV    = '+FieldByName('IDPLANOPREV').AsString+
                        ' AND    IDPESSOA       = '+FieldByName('IDPESSOA').AsString+
                        ' AND    SEQPROPOSTA    = '+FieldByName('SEQPROPOSTA').AsString+
                        ' AND    DATAFINAL IS NULL ' );
        try
           qryEXEC.ExecSQL;
        except
           dtmBaseDados.dbBaseDados.RollBack;
           Exit;
        end;
        inc(icont);
        lblcontador.caption := IntTostr(icont)+' registros processados.';
        Application.processmessages;
        Next;
     end;
  end;
  dtmBaseDados.dbBaseDados.Commit;

end;

procedure TfrmVerificacaoInconsistencia.bbtnAcertaSaldoIniReservaClick(
  Sender: TObject);
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(' SELECT RP.IDPESSJUR, RP.IDTIPORESERVA, RP.IDPESSOA, RP.IDPLANOPREV, RP.VALORRESERVA - SOMA  AS SALDO'+
              ' FROM   RESERVAPART RP,            '+
              '       ( SELECT IDPESSOA, IDTIPORESERVA, '+
              '               SUM(H.VLRCOTAS) AS SOMA  '+
              '        FROM HISTMOVRESERVA H           '+
              '        WHERE  H.IDPESSJUR = 4          '+
              '        AND    H.IDPLANOPREV = 3 '+
              '        AND    H.MESREFERENCIA >= ''2000/01'' '+
              '        AND    H.MESREFERENCIA <= ''2000/12'' '+
              '        GROUP BY IDPESSOA, IDTIPORESERVA ) H  '+
              ' WHERE  RP.IDPESSJUR = 4 '+
              ' AND    RP.IDPLANOPREV = 3 '+
              ' AND    H.IDPESSOA      = RP.IDPESSOA         '+
              ' AND    H.IDTIPORESERVA = RP.IDTIPORESERVA    ');
  qry.Open;
  while not qry.Eof do
  begin
     qryEXEC.Close;
     qryEXEC.SQL.Clear;
     qryEXEC.SQL.Add(' UPDATE HISTMOVRESERVA SET SALDOCOTAS = '+ORANUMERO(QRY.FIELDBYNAME('SALDO').ASSTRING)+
                     ' WHERE  IDPESSJUR      = '+QRY.FieldByName('IDPESSJUR').AsString+
                     ' AND    IDPLANOPREV    = '+QRY.FieldByName('IDPLANOPREV').AsString+
                     ' AND    IDPESSOA       = '+QRY.FieldByName('IDPESSOA').AsString+
                     ' AND    SEQPROPOSTA    = '+QRY.FieldByName('SEQPROPOSTA').AsString+
                     ' AND    IDTIPORESERVA  = '+QRY.FieldByName('IDTIPORESERVA').AsString+
                     ' AND    MESREFERENCIA  = ''1999/12'' ');
     try
        qryEXEC.ExecSQL;
     except
        dtmBaseDados.dbBaseDados.RollBack;
        Exit;
     end;
     qry.Next;
  end;

  dtmBaseDados.dbBaseDados.Commit;
end;




end.