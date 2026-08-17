{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}

unit uGImp;

interface

Uses
  Windows, Messages, SysUtils, Classes, Dialogs, Controls, Forms, DbTables,
  FConfigImp, uCmRegister, DbClient, uCtrlPadroes;

CONST
  SALTO_LINHA_COND_ON  = '27 48';
  SALTO_LINHA_COND_OFF = '27 50';
  EJETAR_PAGINA        = '12';

Type
  TRegConfigImpressora = Class(TPersistent)
  Private
      fValueNameId :string;
      fValueNamePrinter :String;
  public
      Constructor Create;
  published
      property ValueNameId :String Read fValueNameId write fValueNameId;
      property ValueNamePrinter :String Read fValueNamePrinter write fValueNamePrinter;
  End;

  TComandosConfig = Class
  Private
      f10CPI, f10_0CPP, f11_1CPP, f12CPI, f12_5CPP, f14_3CPP, f16_7CPP,
      f20_0CPP, f5_0CPP, f5_6CPP, f6_2CPP, f7_1CPP, f8_3CPP, fBOLD,
      fCONDENSADO, fDOUBLEHIGH, fDOUBLEWIDE, fDOUBLEWIDELINE, fDRAFT,
      fDUPLAPASSADA, fESPACOENTRECARACTER, fINICIALIZACAO, fITALICO,
      fPAG50LIN, fPAG50LINFIM, fRESETBOLD, fRESETCONDENSADO, fRESETDOUBLEHIGH,
      fRESETDOUBLEWIDE, fRESETDOUBLEWIDELINE, fRESETDUPLAPASSADA, fRESETITALICO,
      fRESETSUBLINHADO, fRESETSUPERSUBSCRIPT, fROMAN, fSANSSERIF, fSUBLINHADO,
      fSUBSCRIPT, fSUPERSCRIPT, fNORMAL: String;
  Public
      Property c10CPI                :String  Read f10CPI               Write f10CPI                ;
      Property c10_0CPP              :String  Read f10_0CPP             Write f10_0CPP              ;
      Property c11_1CPP              :String  Read f11_1CPP             Write f11_1CPP              ;
      Property c12CPI                :String  Read f12CPI               Write f12CPI                ;
      Property c12_5CPP              :String  Read f12_5CPP             Write f12_5CPP              ;
      Property c14_3CPP              :String  Read f14_3CPP             Write f14_3CPP              ;
      Property c16_7CPP              :String  Read f16_7CPP             Write f16_7CPP              ;
      Property c20_0CPP              :String  Read f20_0CPP             Write f20_0CPP              ;
      Property c5_0CPP               :String  Read f5_0CPP              Write f5_0CPP               ;
      Property c5_6CPP               :String  Read f5_6CPP              Write f5_6CPP               ;
      Property c6_2CPP               :String  Read f6_2CPP              Write f6_2CPP               ;
      Property c7_1CPP               :String  Read f7_1CPP              Write f7_1CPP               ;
      Property c8_3CPP               :String  Read f8_3CPP              Write f8_3CPP               ;
      Property cBOLD                 :String  Read fBOLD                Write fBOLD                 ;
      Property cCONDENSADO           :String  Read fCONDENSADO          Write fCONDENSADO           ;
      Property cDOUBLEHIGH           :String  Read fDOUBLEHIGH          Write fDOUBLEHIGH           ;
      Property cDOUBLEWIDE           :String  Read fDOUBLEWIDE          Write fDOUBLEWIDE           ;
      Property cDOUBLEWIDELINE       :String  Read fDOUBLEWIDELINE      Write fDOUBLEWIDELINE       ;
      Property cDRAFT                :String  Read fDRAFT               Write fDRAFT                ;
      Property cDUPLAPASSADA         :String  Read fDUPLAPASSADA        Write fDUPLAPASSADA         ;
      Property cESPACOENTRECARACTER  :String  Read fESPACOENTRECARACTER Write fESPACOENTRECARACTER  ;
      Property cINICIALIZACAO        :String  Read fINICIALIZACAO       Write fINICIALIZACAO        ;
      Property cITALICO              :String  Read fITALICO             Write fITALICO              ;
      Property cPAG50LIN             :String  Read fPAG50LIN            Write fPAG50LIN             ;
      Property cPAG50LINFIM          :String  Read fPAG50LINFIM         Write fPAG50LINFIM          ;
      Property cRESETBOLD            :String  Read fRESETBOLD           Write fRESETBOLD            ;
      Property cRESETCONDENSADO      :String  Read fRESETCONDENSADO     Write fRESETCONDENSADO      ;
      Property cRESETDOUBLEHIGH      :String  Read fRESETDOUBLEHIGH     Write fRESETDOUBLEHIGH      ;
      Property cRESETDOUBLEWIDE      :String  Read fRESETDOUBLEWIDE     Write fRESETDOUBLEWIDE      ;
      Property cRESETDOUBLEWIDELINE  :String  Read fRESETDOUBLEWIDELINE Write fRESETDOUBLEWIDELINE  ;
      Property cRESETDUPLAPASSADA    :String  Read fRESETDUPLAPASSADA   Write fRESETDUPLAPASSADA    ;
      Property cRESETITALICO         :String  Read fRESETITALICO        Write fRESETITALICO         ;
      Property cRESETSUBLINHADO      :String  Read fRESETSUBLINHADO     Write fRESETSUBLINHADO      ;
      Property cRESETSUPERSUBSCRIPT  :String  Read fRESETSUPERSUBSCRIPT Write fRESETSUPERSUBSCRIPT  ;
      Property cROMAN                :String  Read fROMAN               Write fROMAN                ;
      Property cSANSSERIF            :String  Read fSANSSERIF           Write fSANSSERIF            ;
      Property cSUBLINHADO           :String  Read fSUBLINHADO          Write fSUBLINHADO           ;
      Property cSUBSCRIPT            :String  Read fSUBSCRIPT           Write fSUBSCRIPT            ;
      Property cSUPERSCRIPT          :String  Read fSUPERSCRIPT         Write fSUPERSCRIPT          ;
      Property cNORMAL               :String  Read fNORMAL              Write fNORMAL               ;
End;

Type
  TStatusImpressora = (siWait,siOffLine,siSenPapel,siDesligada,siErro);

  TTipoFonte        = (TfNormal, TfBold, TfItalico);

  TGImp = class(TComponent)

  Private
      FPorta_Impressora       :String;
      FImpresora              :TextFile;
      FTipoFonte              :TTipoFonte;
      _CdsCodigo              :TClientDataSet;
      fComandosConfig         :TComandosConfig;
      FEjetarPagina,
      FImpCondensado,
      FImpSublinhado,
      FSaltodeLinhaCondensado :Boolean;
      FMostraPrinterSetup     :Boolean;
      FDataBaseName           :String;
      FModelo                 :Integer;
      sIdImpressora, sNomeImpressora: String;
      fRegConfigImpressora: TRegConfigImpressora;
      Procedure SetPorta_Impressora(Value: String);
      function  BuscaCodigo(sMneumonico: String): String;
      procedure SetModelo(Value: Integer);
  Public
      constructor Create(AOwner: TComponent); Override;
      Destructor Destroy; Override;
      function  Inicializar: Boolean;
      procedure ConfigurarImpressora;
      procedure Finalizar;
      procedure ImprimirCodigo(Codigo: string);
      Procedure ImprimirTexto(S: string);
      Procedure ImprimirArquivo(sFileName: string);
      function  TrocaChar(S:string): String;
      function  GetNomeSis: Integer;
      function  GetStatusImp: TStatusImpressora;
      property  ComandosConfig         :TComandosConfig read fComandosConfig;
      property  Modelo                 :Integer         read FModelo Write FModelo;
  Published
      property  Porta_Impressora       :String     read FPorta_Impressora       Write SetPorta_Impressora;
      property  DataBaseName           :String     read FDataBaseName           Write FDataBaseName;
      property  TipoFonte              :TTipoFonte read FTipoFonte              Write FTipoFonte;
      property  MostraPrinterSetup     :Boolean    read FMostraPrinterSetup     Write FMostraPrinterSetup;
      property  EjetarPagina           :Boolean    read FEjetarPagina           Write FEjetarPagina;
      Property  Condensado             :Boolean    read FImpCondensado          Write FImpCondensado;
      property  Sublinhado             :Boolean    read FImpSublinhado          Write FImpSublinhado;
      property  SaltodeLinhaCondensado :Boolean    read FSaltodeLinhaCondensado Write FSaltodeLinhaCondensado;
      property  RegConfigImpressora   :TRegConfigImpressora read fRegConfigImpressora write fRegConfigImpressora;
End;

implementation

Constructor TGImp.Create(AOwner: TComponent);
Begin
  Inherited Create(AOwner);
  fComandosConfig         := TComandosConfig.Create;
  fRegConfigImpressora    := TRegConfigImpressora.Create;
  FEjetarPagina           := False;
  FImpCondensado          := False;
  FImpSublinhado          := False;
  FSaltodeLinhaCondensado := False;
  FTipoFonte              := TfNormal
End;

Destructor TGImp.Destroy;
Begin
  fComandosConfig.Free;
  fRegConfigImpressora.Free;
  Inherited Destroy;
End;

Function TGImp.Inicializar: Boolean;
begin
 Try
   If FMostraPrinterSetup Then
   Begin
      With TFrmConfigImp.Create(Self) Do
        Try
          If FDataBaseName = '' Then FDataBaseName := 'BaseDados';
          Result := (ShowModal = MrOk);
          If Result then
          Begin
            FPorta_Impressora := sNomeImpressora;
            FModelo := StrToInt(sIdImpressora);
            SetModelo(FModelo);
          End
          Else
            Exit;
        finally
          Free
        End;
   End
   Else
   Begin
      Try
        CmRegister := TCmRegister.Create;
        sIdImpressora   := CmRegister.LerStringReg(HKEY_CURRENT_USER,'Software\CM\Impressora Genérica', fRegConfigImpressora.ValueNameId,'');
        sNomeImpressora := CmRegister.LerStringReg(HKEY_CURRENT_USER,'Software\CM\Impressora Genérica', fRegConfigImpressora.ValueNamePrinter,'');

        If (sIdImpressora <> '') And (sNomeImpressora <> '') Then
        Begin
          FModelo := StrToInt(sIdImpressora);
          FPorta_Impressora := sNomeImpressora;
          SetModelo(FModelo);
        End;

      finally
        CmRegister.Free;
      End;
   End;

   Result := True;
   AssignFile(FImpresora,FPorta_Impressora);
   ReWrite(FImpresora);

   ImprimirCodigo(fComandosConfig.fINICIALIZACAO);
   ImprimirCodigo(fComandosConfig.fNORMAL);

 Except
   CloseFile(FImpresora);
   Application.MessageBox('Impressora Não Encontrada. Verifique a Configuração da Impressora','Aviso',Mb_IConInformation);
   Result := False;
 End;
end;

Procedure TGImp.Finalizar;
Begin
   If FEjetarPagina Then
      ImprimirCodigo(EJETAR_PAGINA);

   CloseFile(FImpresora);
End;

procedure TGImp.ConfigurarImpressora;
Begin
    With TFrmConfigImp.Create(Self) Do
      Try
        If FDataBaseName = '' Then FDataBaseName := 'BaseDados';
        If (ShowModal = MrOk) then
        Begin
          FPorta_Impressora := sNomeImpressora;
          FModelo := StrToInt(sIdImpressora);
          SetModelo(FModelo);
        End
        Else
          Exit;
      finally
        Free
      End;
End;

Procedure TGImp.SetPorta_Impressora(Value: String);
Begin
    FPorta_Impressora := UpperCase(Value);
End;

Function TGImp.GetNomeSis: Integer;
Var
  OsInfo: TOsVersionInfoA;
begin

  OsInfo. dwOSVersionInfoSize := sizeof(OsInfo);
  Result := 0;

  If GetVersionEx(OsInfo) Then
  Case OsInfo.dwPlatformId of
    VER_PLATFORM_WIN32_NT: Result := 0;
    VER_PLATFORM_WIN32_WINDOWS: Result := 1;
  Else
    Result := 2;
  End;
End;

procedure TGImp.SetModelo(Value: Integer);
begin
  _CdsCodigo := TClientDataSet.Create(Application);
  Try
     _CdsCodigo.Data := Padroes.GetDataPacket('SELECT CODIGO, MNEUMONICO FROM CODIGOIMPRESSORA WHERE (IDIMPRESSORA = ' + IntToStr(Value) + ')');
     _CdsCodigo.First;

     fComandosConfig.f10CPI               := BuscaCodigo('10 CPI');
     fComandosConfig.f10_0CPP             := BuscaCodigo('10.0 CPP');
     fComandosConfig.f11_1CPP             := BuscaCodigo('11.1 CPP');
     fComandosConfig.f12CPI               := BuscaCodigo('12 CPI');
     fComandosConfig.f12_5CPP             := BuscaCodigo('12.5 CPP');
     fComandosConfig.f14_3CPP             := BuscaCodigo('14.3 CPP');
     fComandosConfig.f16_7CPP             := BuscaCodigo('16.7 CPP');
     fComandosConfig.f20_0CPP             := BuscaCodigo('20.0 CPP');
     fComandosConfig.f5_0CPP              := BuscaCodigo('5.0 CPP');
     fComandosConfig.f5_6CPP              := BuscaCodigo('5.6 CPP');
     fComandosConfig.f6_2CPP              := BuscaCodigo('6.2 CPP');
     fComandosConfig.f7_1CPP              := BuscaCodigo('7.1 CPP');
     fComandosConfig.f8_3CPP              := BuscaCodigo('8.3 CPP');
     fComandosConfig.fBOLD                 := BuscaCodigo('BOLD');
     fComandosConfig.fCONDENSADO           := BuscaCodigo('CONDENSADO');
     fComandosConfig.fDOUBLEHIGH           := BuscaCodigo('DOUBLEHIGH');
     fComandosConfig.fDOUBLEWIDE           := BuscaCodigo('DOUBLEWIDE');
     fComandosConfig.fDOUBLEWIDELINE       := BuscaCodigo('DOUBLEWIDELINE');
     fComandosConfig.fDRAFT                := BuscaCodigo('DRAFT');
     fComandosConfig.fDUPLAPASSADA         := BuscaCodigo('DUPLAPASSADA');
     fComandosConfig.fESPACOENTRECARACTER  := BuscaCodigo('ESPACOENTRECARACTER');
     fComandosConfig.fINICIALIZACAO        := BuscaCodigo('INICIALIZACAO');
     fComandosConfig.fITALICO              := BuscaCodigo('ITALICO');
     fComandosConfig.fPAG50LIN             := BuscaCodigo('PAG50LIN');
     fComandosConfig.fPAG50LINFIM          := BuscaCodigo('PAG50LINFIM');
     fComandosConfig.fRESETBOLD            := BuscaCodigo('RESETBOLD');
     fComandosConfig.fRESETCONDENSADO      := BuscaCodigo('RESETCONDENSADO');
     fComandosConfig.fRESETDOUBLEHIGH      := BuscaCodigo('RESETDOUBLEHIGH');
     fComandosConfig.fRESETDOUBLEWIDE      := BuscaCodigo('RESETDOUBLEWIDE');
     fComandosConfig.fRESETDOUBLEWIDELINE  := BuscaCodigo('RESETDOUBLEWIDELINE');
     fComandosConfig.fRESETDUPLAPASSADA    := BuscaCodigo('RESETDUPLAPASSADA');
     fComandosConfig.fRESETITALICO         := BuscaCodigo('RESETITALICO');
     fComandosConfig.fRESETSUBLINHADO      := BuscaCodigo('RESETSUBLINHADO');
     fComandosConfig.fRESETSUPERSUBSCRIPT  := BuscaCodigo('RESETSUPERSUBSCRIPT');
     fComandosConfig.fROMAN                := BuscaCodigo('ROMAN');
     fComandosConfig.fSANSSERIF            := BuscaCodigo('SANSSERIF');
     fComandosConfig.fSUBLINHADO           := BuscaCodigo('SUBLINHADO');
     fComandosConfig.fSUBSCRIPT            := BuscaCodigo('SUBSCRIPT');
     fComandosConfig.fSUPERSCRIPT          := BuscaCodigo('SUPERSCRIPT');
     fComandosConfig.fNORMAL               := fComandosConfig.fRESETBOLD + ' ' + fComandosConfig.fRESETITALICO;
  finally
     _CdsCodigo.Close;
     _CdsCodigo.Free;
     FModelo := Value;
  End;
end;

function TGImp.GetStatusImp: TStatusImpressora;
var
  Pto : Word;
  Rdo : byte;
  Confirmado : boolean;
  TextoError : string;
  Estado : TStatusImpressora;
begin
 try
  if (GetNomeSis <> 0) And  (POS('LPT',UpperCase(FPorta_Impressora)) <> 0) then
    begin
      Estado := siErro;
      Confirmado := False;
      While (Estado <> siWait) and (not Confirmado) do
        begin
          try
            Pto := StrToInt(Copy(FPorta_Impressora,Length(FPorta_Impressora),1));
          finally
          end;
            asm
              MOV  DX,Pto
              MOV  AX,$0200
              INT  $17
              MOV  Rdo,AH
            end;
          if Rdo = 144 then
            Estado := siWait
          else if Rdo = 24 then
            begin
              Estado := siOffLine;
              TextoError := 'A impresora está fora de linha. Solucione o problema e tente novamente.';
            end
          else if Rdo = 56 then
            begin
              Estado := siSenPapel;
              TextoError := 'A impresora está sem papel. Solucione o problema e tente novamente.';
            end
          else if Rdo = 32 then
            begin
              Estado := siDesligada;
              TextoError := 'A impresora está Desligada. Solucione o problema e tente novamente.';
            end
          else
            begin
              Estado := siErro;
              TextoError := 'A impresora tem un problema Desconhecido. Solucione o problema e tente novamente.';
            end;
          if Estado <> siWait then
            begin
              if MessageDlg(TextoError,mtError,[mbRetry,mbCancel],0) = mrCancel then
                Confirmado := True;
            end;
        end;
      Result := Estado;
    end
  else
    begin
      Result := siWait;
    end;
 finally

 end;
end;


procedure TGImp.ImprimirCodigo(Codigo:string);
var
  Sub : string;
  Cod : byte;
  P : byte;
begin
  Sub := Codigo;
  While Length(Sub) > 0 do
    begin
      P := Pos(#32,Sub);
      if P = 0 then
        begin
         try
          Cod := StrToInt(Sub);
          Write(FImpresora,chr(Cod));
          Sub := '';
         except
         end;
        end
      else
        begin
         try
          Cod := StrToInt(Copy(Sub,1,P-1));
          Write(FImpresora,chr(Cod));
          Sub := Copy(Sub,P+1,Length(Sub)-3);
         except
         end;
        end;
    end;
end;

function  TGImp.BuscaCodigo(sMneumonico: String): String;
Begin
 If _CdsCodigo.Locate('MNEUMONICO',sMneumonico,[]) Then
    Result := _CdsCodigo.FieldByName('CODIGO').AsString
 Else
    Result := '';
End;

Procedure TGImp.ImprimirTexto(S:String);
Begin
   If FSaltodeLinhaCondensado Then
      ImprimirCodigo(SALTO_LINHA_COND_ON);

   If FimpCondensado Then
      ImprimirCodigo(fComandosConfig.fCONDENSADO);

   If FimpSublinhado Then
      ImprimirCodigo(fComandosConfig.fSUBLINHADO);

   Case FTipoFonte of
     TfNormal : ImprimirCodigo(fComandosConfig.fNORMAL);
     TfBold   : ImprimirCodigo(fComandosConfig.fBOLD);
     TfItalico: ImprimirCodigo(fComandosConfig.fITALICO);
   End;

   WriteLn(FImpresora,TrocaChar(S));

   If FImpCondensado Then
      ImprimirCodigo(fComandosConfig.fRESETCONDENSADO);

   If FImpSublinhado Then
      ImprimirCodigo(fComandosConfig.fRESETSUBLINHADO);

   If FSaltodeLinhaCondensado Then
      ImprimirCodigo(SALTO_LINHA_COND_OFF);
End;

function TGImp.TrocaChar(S:string): String;
Var sAuxiliar, pAuxiliar: String;
    x, iTam: Integer;
Begin

  sAuxiliar := S;
  iTam := Length(sAuxiliar);
  pAuxiliar := sAuxiliar;

  If Trim(sAuxiliar) <> '' Then
  Begin
     For X:=1 to iTam Do
     Begin
       If pAuxiliar[x] <> ' ' Then
          If (Ord(pAuxiliar[x]) >= 192) And (Ord(pAuxiliar[x]) <= 198) Then
             pAuxiliar[x] := 'A'
          Else
             If (Ord(pAuxiliar[x]) >= 224) And (Ord(pAuxiliar[x]) <= 230) Then
                 pAuxiliar[x] := 'A'
          Else
            If (Ord(pAuxiliar[x]) >= 200) And (Ord(pAuxiliar[x]) <= 203) Then
                pAuxiliar[x] := 'E'
            Else
            If (Ord(pAuxiliar[x]) >= 232) And (Ord(pAuxiliar[x]) <= 235) Then
                pAuxiliar[x] := 'E'
            Else
              If (Ord(pAuxiliar[x]) >= 204) And (Ord(pAuxiliar[x]) <= 207) Then
                 pAuxiliar[x] := 'I'
              Else
                 If (Ord(pAuxiliar[x]) >= 236) And (Ord(pAuxiliar[x]) <= 239) Then
                    pAuxiliar[x] := 'I'
              Else
                If (Ord(pAuxiliar[x]) >= 210) And (Ord(pAuxiliar[x]) <= 214) Then
                   pAuxiliar[x] := 'O'
                Else
                   If (Ord(pAuxiliar[x]) >= 242) And (Ord(pAuxiliar[x]) <= 246) Then
                    pAuxiliar[x] := 'O'
                Else
                  If (Ord(pAuxiliar[x]) >= 217) And (Ord(pAuxiliar[x]) <= 220) Then
                     pAuxiliar[x] := 'U'
                  Else
                  If (Ord(pAuxiliar[x]) >= 249) And (Ord(pAuxiliar[x]) <= 252) Then
                      pAuxiliar[x] := 'U'
                  Else
                    If (Ord(pAuxiliar[x]) = 209) or (Ord(pAuxiliar[x]) = 241) Then
                       pAuxiliar[x] := 'N'
                    Else
                      If (Ord(pAuxiliar[x]) = 199) Or (Ord(pAuxiliar[x]) = 231) Then
                         pAuxiliar[x] := 'C'
                      Else
                       If ((Ord(pAuxiliar[x]) < 33) Or (Ord(pAuxiliar[x]) > 57))  And
                          ((Ord(pAuxiliar[x]) < 40) Or (Ord(pAuxiliar[x]) > 41))  And
                          ((Ord(pAuxiliar[x]) < 65) Or (Ord(pAuxiliar[x]) > 90))  And
                          ((Ord(pAuxiliar[x]) < 97) Or (Ord(pAuxiliar[x]) > 122))  Then
                          pAuxiliar[x] := ' ';
     End;

     sAuxiliar := Copy(pAuxiliar,1,itam);
  End;

  If Trim(sAuxiliar) = '' Then
     sAuxiliar := ' ';
  Result := UpperCase(sAuxiliar);
end;

Procedure TGImp.ImprimirArquivo(sFileName: string);
Var
  Arquivo: TextFile;
  S: String;
  iLinha: Integer;
Begin
  If FileExists(sFileName) Then
  Begin
    Try
      AssignFile(Arquivo,sFileName);
      Reset(Arquivo);
      iLinha := 0;
      While Not Eof(Arquivo) Do
      Begin
        Inc(iLinha);
        ReadLn(Arquivo,S);
        If FSaltodeLinhaCondensado Then
           ImprimirCodigo(SALTO_LINHA_COND_ON);

        If FimpCondensado Then
           ImprimirCodigo(fComandosConfig.fCONDENSADO);

        If FimpSublinhado Then
           ImprimirCodigo(fComandosConfig.fSUBLINHADO);

        Case FTipoFonte of
          TfNormal : ImprimirCodigo(fComandosConfig.fNORMAL);
          TfBold   : ImprimirCodigo(fComandosConfig.fBOLD);
          TfItalico: ImprimirCodigo(fComandosConfig.fITALICO);
        End;

        WriteLn(FImpresora,TrocaChar(S));

        If FImpCondensado Then
           ImprimirCodigo(fComandosConfig.fRESETCONDENSADO);

        If FImpSublinhado Then
           ImprimirCodigo(fComandosConfig.fRESETSUBLINHADO);

        If FSaltodeLinhaCondensado Then
           ImprimirCodigo(SALTO_LINHA_COND_OFF);

        If (FEjetarPagina) And (iLinha >= 63) Then
        Begin
           iLinha := 0;
           ImprimirCodigo(EJETAR_PAGINA);
        End;
      End;
    Finally
      Close(Arquivo);
    End;
  End
  Else
     Application.MessageBox('Arquivo para impressão não encontrado','Aviso',Mb_IconStop);
End;


{ TRegConfigImpressora }

constructor TRegConfigImpressora.Create;
begin
  Inherited;
  fValueNameId := 'IdImpressora';
  fValueNamePrinter := 'Impressora\Porta';
end;


end.


