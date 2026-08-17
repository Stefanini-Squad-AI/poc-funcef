{*******************************************************}
{                                                       }
{   FSM Library - by Fábio S Monteiro                   }
{                                                       }
{   Copyright © 1999  FSM Desenvolvimento               }
{                                                       }
{*******************************************************}
unit FSMConsts;

interface

type
  TNameShowKind = (skLong, skShort, skNumber);

resourcestring
  sOpenDataSetError = 'Ocorreu um erro na abertura do Arquivo %s';
  sPostDataSetError = 'Impossível salvar no Arquivo %s';
  sConfirmNewRow = 'Confirma inclusão do registro ?';
  sConfirmAltRow = 'Confirma alteração do registro ?';
  sConfirmDelRow = 'Confirma exclusão de: %s ?';
  sConfirmPost   = 'Os Dados foram alterados. Deseja salvá-los ?';
  sRowNotExistConfirmInclusion = 'Este(a) %s não existe. Confirma inclusão ?';
  sOpCanceled = 'Operação Cancelada!';

  {TFSMProgressDlg}
  sInvalidProcedure = 'Procedure ou Método Inválido';

  {TFSMSharewareSecurity}
  sRegistryError = 'Ocorreu um erro fatal ao tentar acessar o Registro!';
  sLockMessage = 'Acabou o período de experiência para este software.'#13'Se quiser continuar a usá-lo registre-o.';
  
  { TFSMExtenso Strings }

  s0   = 'ZERO';
  s1   = 'UM';
  s2   = 'DOIS';
  s3   = 'TRES';
  s4   = 'QUATRO';
  s5   = 'CINCO';
  s6   = 'SEIS';
  s7   = 'SETE';
  s8   = 'OITO';
  s9   = 'NOVE';
  s10  = 'DEZ';
  s11  = 'ONZE';
  s12  = 'DOZE';
  s13  = 'TREZE';
  s14  = 'QUATORZE';
  s15  = 'QUINZE';
  s16  = 'DEZESSEIS';
  s17  = 'DEZESSETE';
  s18  = 'DEZOITO';
  s19  = 'DEZENOVE';
  s20  = 'VINTE';
  s30  = 'TRINTA';
  s40  = 'QUARENTA';
  s50  = 'CINQUENTA';
  s60  = 'SESSENTA';
  s70  = 'SETENTA';
  s80  = 'OITENTA';
  s90  = 'NOVENTA';
  s100 = 'CEM';
  s100_= 'CENTO';
  s200 = 'DUZENTOS';
  s300 = 'TREZENTOS';
  s400 = 'QUATROCENTOS';
  s500 = 'QUINHENTOS';
  s600 = 'SEISCENTOS';
  s700 = 'SETECENTOS';
  s800 = 'OITOCENTOS';
  s900 = 'NOVECENTOS';
  s1T  = 'MIL';
  s1M  = 'MILHÃO';
  s1Ms = 'MILHÕES';
  s1B  = 'BILHÃO';
  s1Bs = 'BILHÕES';

  {TFSMBDEAliasCombo}

        // Resource Names, do not translate
  sNativeImage = 'ALIASNATIVO';
  sODBCImage   = 'ALIASODBC';


  {TFSMceCombo}
  sFSMceCombo  = 'Items...';
implementation

end.
